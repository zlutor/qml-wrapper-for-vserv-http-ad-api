/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
import "request"
Item
{
    id : imageContentViewer

    property alias contentSourceUrl: imageObject.source
    property url redirectUrl
    property alias clickUrl : httpObject.requestUrl

    signal consumed()

    visible: false

    Image
    {
        id: imageObject
        anchors.fill: parent

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                httpObject.sendRequest()
                Qt.openUrlExternally(redirectUrl)
                imageContentViewer.consumed()
                // TODO: call click URL
            }
        }

        onStatusChanged:
        {
            //imageContentViewer.visible = (Image.Ready === imageObject.status)
        }
    }

    QmlXmlHttpRequest
    {
        id:httpObject
        command: "POST"
    }

    function show(contentSourceUrl, redirectUrl, clickUrl)
    {
        console.debug("contentSourceUrl: ", contentSourceUrl)
        console.debug("redirectUrl: ", redirectUrl)
        console.debug("clickUrl: ", clickUrl)

        imageContentViewer.contentSourceUrl = contentSourceUrl
        imageContentViewer.redirectUrl = redirectUrl
        imageContentViewer.clickUrl = clickUrl

        imageContentViewer.visible = true
    }
}

