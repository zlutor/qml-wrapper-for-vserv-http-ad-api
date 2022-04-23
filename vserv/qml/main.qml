/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.2
import "content"

ApplicationWindow {
    id : main
    title: qsTr("Vserv QML API demo")
    width: 450
    height: 800
    visible: true

    color: "black"

    Content
    {
        id                      : content
        visible                 : false
        anchors.fill            : parent

        timeoutInMillisec       : 10000
        temporaryContentStorage : vservContentStorage
        mandatoryContentRequestParams.adspot    : "8063"    // Billboard Test ZoneID
        //mandatoryContentRequestParams.adspot    : "20846"    // Banner Test ZoneID
        mandatoryContentRequestParams.userAgent : content.mandatoryContentRequestParams.androidUserAgent
        mandatoryContentRequestParams.source    : "com.example.yourapplication"
        mandatoryContentRequestParams.tm        : content.mandatoryContentRequestParams.testModeOff
        //mandatoryContentRequestParams.tm        : content.mandatoryContentRequestParams.testModeOn

        criticalContentRequestParams.mobileAppIds.imeiNumber: "1234556789"
        criticalContentRequestParams.iabcat: "IAB2-13"

        importantContentRequestParams.deviceRenditionParameters.screenWidth: "450"
        importantContentRequestParams.deviceRenditionParameters.screenHeight: "800"

        // Phuket, Thailand
        importantContentRequestParams.geoParameters.latitude: "7.90353"
        importantContentRequestParams.geoParameters.longitude: "98.39583"
        importantContentRequestParams.userDemographics.ageOfUser: "17"

        onContentSkipped:
        {
            console.debug("Content skipped")
            main.color = "blue"
            content.visible = false
        }

        onNoContentReceived: {
            console.debug("No content received")
            main.color = "steel"
            content.visible = false
        }

        onContentConsumed: {
            console.debug("Content consumed")
            main.color = "gold"
            content.visible = false
        }
    }

    Component.onCompleted:
    {
        fetchContent()
    }

    function fetchContent()
    {
        content.visible = false
        content.fetchContent()
    }
}
