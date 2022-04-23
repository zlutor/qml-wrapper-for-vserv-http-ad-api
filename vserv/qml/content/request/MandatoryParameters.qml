import QtQuick 2.5
import "MandatoryParameters.js" as Logic

/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
Item {
    // Alphanumeric zone key from your Vserv account.
    // [E.g. dgss139] This is the single most important parameter in the API call.
    // Adspot/Zone settings govern the Ad size [Banner / Full Screen],
    // Environment [Mobile Apps / Mobile Sites],
    // Ad media [Whether rich media ads are allowed],
    // Allowed advertiser categories and so on...
    property string adspot

    // Requesting device (Client) User-Agent
    readonly property string androidUserAgent : "Mozilla/5.0 (Linux; U; Android 2.2.1; en-us; device Build/FRG83) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Safari/533.1"
    readonly property string sailfishUserAgent: "Mozilla/5.0 (Maemo; Linux; U; Jolla; Sailfish; Mobile; rv:31.0) Gecko/31.0 Firefox/31.0 SailfishBrowser/1.0"
    property string userAgent

    // The site/app identification.
    // e.g. any of
    // - HTTP header HOST (for sites)
    // - Packagename
    // - Bundle identifier
    // - Product ID (for apps)
    property string source

    // Indicates Test mode
    readonly property string testModeOn : "1"
    readonly property string testModeOff : "0"
    property string tm : testModeOff

    function toUriParameters()
    {
        var helper = new Logic.MandatoryParameters(adspot, userAgent, source, tm)
        return helper.toUriParameters()
    }
}

