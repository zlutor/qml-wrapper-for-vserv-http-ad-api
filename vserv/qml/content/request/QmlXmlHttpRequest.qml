/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5

/*
 * http://www.w3.org/TR/XMLHttpRequest/
 * http://doc-snapshot.qt-project.org/qt5-5.4/qtqml-javascript-qmlglobalobject.html#xmlhttprequest
 */
Item {
    signal requestTimeout()
    signal readyStateChanged( int readyState
                            , int httpStatus
                            , string responseText)

    readonly property int readyState_UNSENT : 0
    readonly property int readyState_OPENED : 1
    readonly property int readyState_HEADERS_RECEIVED : 2
    readonly property int readyState_LOADING : 3
    readonly property int readyState_DONE : 4

    property string command: "GET"
    property int timeoutValue : 10000
    property string requestUrl
    property var headers : []
    property string body


    //-- PRIVATE --
    property var xmlHttpRequest
    id : httpRequestItem

    function abort() { xmlHttpRequest.abort() }

    // http://en.wikipedia.org/wiki/XMLHttpRequest#The_onreadystatechange_event_listener
    // http://doc-snapshot.qt-project.org/qt5-5.4/qtqml-javascript-qmlglobalobject.html#xmlhttprequest
    // http://www.w3.org/TR/XMLHttpRequest/
    //function sendRequest(request, timeoutValue)
    function sendRequest()
    {
        xmlHttpRequest = new XMLHttpRequest()
        xmlHttpRequest.timeout = timeoutValue;
        xmlHttpRequest.ontimeout = function () { requestTimeout() }
        xmlHttpRequest.onreadystatechange = function () {
            if (readyState_LOADING <= xmlHttpRequest.readyState )
            {
                readyStateChanged( xmlHttpRequest.readyState
                                 , xmlHttpRequest.status
                                 , xmlHttpRequest.responseText)
            }
            else
            {
                readyStateChanged( xmlHttpRequest.readyState
                                 , 0
                                 , "")
            }
        }

        // asynchronous call
        xmlHttpRequest.open(command, requestUrl, true)

        for ( var headerIndex = 0; headerIndex < headers.length; ++headerIndex)
        {
            var headerName = headers[headerIndex][0]
            var headerValue = headers[headerIndex][1]
            xmlHttpRequest.setRequestHeader(headerName, headerValue)
        }

        xmlHttpRequest.send(body)
    }

    Component.onCompleted: {  }
}

