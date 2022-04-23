import QtQuick 2.5
import "AdResponse.js" as AdResponse

/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
Item {
    signal requestTimeout()
    signal noFill(string payload)
    signal adspotKeyMissing(string payload)
    signal userAgentMissing(string payload)
    signal sourceParameterMissing(string payload)

    signal htmlContentReceived(string htmlContent)
    signal imageContentReceived( url contentSourceUrl
                               , url redirectUrl
                               , url clickUrl)
    signal videoContentReceived( url contentSourceUrl
                               , url redirectUrl
                               , url clickUrl)

    id: communication

    function fetchContent(requestUrl, timeoutValue)
    {
        httpObject.requestUrl = requestUrl
        httpObject.timeoutValue = timeoutValue
        httpObject.sendRequest()
    }

    QmlXmlHttpRequest
    {
        id: httpObject

        onReadyStateChanged:
        {
            if ( httpObject.readyState_DONE === readyState
              && httpStatus === 200
               )
            {
                console.debug("responseText: '", responseText, "'")

                try {
                    var responseInJsonFormat = JSON.parse(responseText)

                    if (responseInJsonFormat.errors === undefined)
                    {
                        var statusCode = responseInJsonFormat["status"]
                        var payload = responseInJsonFormat["ad"]
                        console.debug("payload: ", payload)

                        if (AdResponse.STATUS_CODE_SuccessfulAdResponse === statusCode)
                        {
                            signalContentReceived(payload)
                        }
                        else if (AdResponse.STATUS_CODE_NoFill === statusCode)
                        {
                            noFill(payload)
                        }
                        else if (AdResponse.STATUS_CODE_AdspotKeyMissing === statusCode)
                        {
                            adspotKeyMissing(payload)
                        }
                        else if (AdResponse.STATUS_CODE_SourceParameterMissing === statusCode)
                        {
                            sourceParameterMissing(payload)
                        }
                        else if (AdResponse.STATUS_CODE_UserAgentMissing === statusCode)
                        {
                            userAgentMissing(payload)
                        }
                        else
                        {
                            console.log("Unexpected response received - status code: "
                                       , statusCode, "payload: ", payload)
                        }
                    }
                    else
                    {
                        console.error("Error in parsing response: ", responseInJsonFormat.errors)
                    }
                }
                catch(ex)
                {
                    console.debug("Error during parsing (message): ", ex.message)
                    console.debug("Error during parsing (response): '",responseText, "'")
                    noFill("")
                }
            }
        }

        onRequestTimeout: { communication.requestTimeout() }
    }

    function signalContentReceived( payload )
    {
        var parsedPayload = payload.split("\n")
        if (!isHtmlContent(parsedPayload[0]))
        {
            // TODO: Vserv to provide better response structure
            // JSON or no unnecessary '\n's...
            var contentType = parsedPayload[0]
            var contentSourceUrl = parsedPayload[1]
            var redirectUrl = parsedPayload[2]
            var clickUrl = parsedPayload[7]

            if ( isImageContent(contentType))
            {
                console.debug("Vserv: image content")
                imageContentReceived(contentSourceUrl, redirectUrl, clickUrl)
            }
            else if (isVideoContent(contentType))
            {
                console.debug("Vserv: video content")
                videoContentReceived(contentSourceUrl, redirectUrl, clickUrl)
            }
        }
        else
        {
            console.debug("Vserv: html content")

            // let's center the content
            payload = "<style> img { width:100%; height:100%; } </style>"
                    + payload

            console.debug("Vserv: STRECHED html content")

            htmlContentReceived(payload)
        }
    }

    function isImageContent(contentType)
    {
        return contentType === "image"
    }

    function isVideoContent(contentType)
    {
        return contentType === "video"
    }

    function isHtmlContent(parsedPayload)
    {
        return !isImageContent(parsedPayload) && !isVideoContent(parsedPayload)
    }
}


