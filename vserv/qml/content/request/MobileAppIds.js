/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
.pragma library
.import "UriHelper.js" as UriHelper

var MobileAppIds = function( applicationName
                           , advertiserId        // iOS/Android
                           , wpDeviceUniqueId    // Applicable for Windows Phone
                           , imeiNumber
                           )
{
    this.mn = applicationName   // Application Name
    this.advid = advertiserId   // iOS/Android Advertiser Id
    this.wid = wpDeviceUniqueId // Device Unique Id (Applicable for Windows Phone)
    this.im = imeiNumber        // IMEI No

    // Universally Unique Identifier(Applicable for iOS)
    /*[Deprecated] */ this.uuid = UriHelper.EMPTY_VALUE

    // Android Id (Applicable for Android)
    /*[Deprecated] */ this.aid = UriHelper.EMPTY_VALUE
};

MobileAppIds.prototype =
{
    toUriParameters : function() {
        var params = UriHelper.addParameter("", "mn",this.mn)
        params = UriHelper.addParameter(params, "advid", this.advid)
        params = UriHelper.addParameter(params, "wid", this.wid)
        params = UriHelper.addParameter(params, "im", this.im)
        params = UriHelper.addParameter(params, "uuid", this.uuid)
        params = UriHelper.addParameter(params, "aid", this.aid)
        return params
    },

    // Universally Unique Identifier(Applicable for iOS)
    /*[Deprecated] */ setUniversallyUniqueIdentifier : function(uuid) {
        this.uuid = uuid
    },

    // Android Id (Applicable for Android)
    /*[Deprecated] */ setAndroidId : function(aid) {
        this.aid = aid
    }
};
