/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
import "MobileAppIds.js" as Logic

Item
{
    // Application Name
    property string applicationName

    // iOS/Android Advertiser Id
    property string advertiserId

    // Device Unique Id (Applicable for Windows Phone)
    property string wpDeviceUniqueId

    // IMEI Number
    property string imeiNumber

    // [Deprecated] Universally Unique Identifier(Applicable for iOS)
    property string universallyUniqueIdentifierForIOS

    // [Deprecated] Android Id (Applicable for Android)
    property string androidId

    function toUriParameters()
    {
        var helper = new Logic.MobileAppIds( applicationName
                                           , advertiserId
                                           , wpDeviceUniqueId
                                           , imeiNumber
                                           )

        // deprecated fields
        helper.setUniversallyUniqueIdentifier(universallyUniqueIdentifierForIOS)
        helper.setAndroidId(androidId)

        return helper.toUriParameters()
    }
}

