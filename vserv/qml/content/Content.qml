import QtQuick 2.5
import "request"

/*
 * source: https://docs.google.com/document/d/139TRSTV33tLxKxbew4yPTPF4uc8PZJPiRkxyo9GymIE/edit
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
Item
{
    id: content
    property alias mandatoryContentRequestParams: requestParameters.mandatory
    property alias criticalContentRequestParams : requestParameters.critical
    property alias importantContentRequestParams: requestParameters.important

    property alias temporaryContentStorage  : htmlContentViewer.temporaryContentStorage
    property int timeoutInMillisec          : 5000
    property alias refreshIntervalInMillisec: refreshTimer.interval
    readonly property int noRefresh         : 0

    // UGLY hack - otherwise timer does not stop on Sailfish...
    property bool isRefreshRunning          : false

    readonly property string requestUrl : "http://rq.vserv.mobi/getad.php"

    signal contentReceived()
    signal noContentReceived()
    signal contentSkipped()
    signal contentConsumed()
    signal contentRequestTimeout()

    function getSome()
    {
        if ( noRefresh !== refreshTimer.interval ) { refreshTimer.restart() }
        fetchContent()
    }

    function stop() { refreshTimer.stop();isRefreshRunning=false; hideContent() }

    Timer
    {
        id              : refreshTimer
        interval        : content.noRefresh
        running         : isRefreshRunning
        triggeredOnStart: false
        repeat          : true

        onIntervalChanged: {
            if ( noRefresh === interval ) {
                refreshTimer.stop();isRefreshRunning = false
            }
        }
        onTriggered: { console.debug("!!! Triggered !!!"); fetchContent() }
        onRunningChanged: { console.debug("Running: ", running) }
    }

    ContentRequestParameters { id : requestParameters }

    Communication{
        id : adProvider

        onHtmlContentReceived:
        {
            showContent()
            htmlContentViewer.show(htmlContent)
            contentReceived()
        }

        onImageContentReceived:
        {
            showContent()
            imageContentViewer.show(contentSourceUrl, redirectUrl, clickUrl)
            contentReceived()
        }
        onVideoContentReceived:
        {
            showContent()
            videoContentViewer.show(contentSourceUrl, redirectUrl, clickUrl)
            contentReceived()
        }

        onRequestTimeout:
        {
            console.debug("Content request timeout...")
            contentRequestTimeout()
        }

        onNoFill:
        {
            console.debug("No content received...")
            noContentReceived()
        }
    }

    ImageContent
    {
        id          : imageContentViewer
        anchors.fill: parent
        visible     : false

        onConsumed: { contentConsumed()}
    }

    VideoContent
    {
        id          : videoContentViewer
        anchors.fill: parent
        visible     : false
    }

    HtmlContent
    {
        id              : htmlContentViewer
        anchors.fill    : parent
        visible         : false

        onConsumed: { contentConsumed()}
    }

    Image
    {
        id              : skipIcon
        source          : "bezar-flat-long-shadow.png"
        height          : dimension()
        width           : dimension()
        anchors.top     : parent.top
        anchors.left    : parent.left
        //anchors.margins : dimension()*0.1

        MouseArea
        {
            anchors.fill: parent
            onClicked: { stop(); contentSkipped() }
        }

        function dimension() { return Math.ceil(Math.min(parent.width, parent.height)*0.1)}
    }

    function fetchContent()
    {
        hideContent()
        var request = requestParameters.makeRequest(content.requestUrl)
        adProvider.fetchContent(request, timeoutInMillisec)
    }

    function hideContent()
    {
        content.visible = false
        skipIcon.visible = false
        imageContentViewer.visible = false
        videoContentViewer.visible = false
        htmlContentViewer.visible = false
    }

    function showContent() {
        content.visible = true
        skipIcon.visible = true
    }
}

