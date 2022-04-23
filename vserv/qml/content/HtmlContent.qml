/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
//import QtWebKit 3.0 -> Sailfish
import QtWebView 1.0

Item
{
    property variant temporaryContentStorage
    property string contentId : createUniqueContentId()

    signal consumed()

    id: htmlContentViewer
    visible: false

    WebView {
        id: webViewer
        z : 1
        anchors.fill: parent
        anchors.topMargin: height/10
        // usable with WebKit Webview...
        //        onNavigationRequested : {
        //            console.debug("request.url: ", request.url)
        //            if (request.navigationType === WebView.LinkClickedNavigation) {
        //                request.action = WebView.IgnoreRequest
        //                Qt.openUrlExternally(request.url)
        //            }
        //        }
        // usable with WebKit Webview...
    }

    function show(htmlContent)
    {
        // if incoming content is stored into local file
        // neded if Qt 5.5 is not available...
        //        var contentLocation = temporaryContentStorage.pushContent(contentId, htmlContent)
        //        var contentFileUrl = "file://"+contentLocation
        //        webViewer.url = contentFileUrl
        console.debug(htmlContent)

        // if WebKit/Qt 5.5+ Webview is used
        webViewer.loadHtml(htmlContent)
        htmlContentViewer.visible = true
    }

    function createUniqueContentId()
    {
        return temporaryContentStorage.createUniqueContentId()
    }

    function drop()
    {
        temporaryContentStorage.dropContent(contentId)
    }

    Component.onDestruction:
    {
        temporaryContentStorage.dropContent(contentId)
    }
}

