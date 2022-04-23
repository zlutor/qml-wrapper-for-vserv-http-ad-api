/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
.pragma library
.import "UriHelper.js" as UriHelper
.import "StrictBannerDimensionValues.js" as StrictBannerDimensionValues

/*
    Help Vserv decide best ad size, media and leads to best user experience
*/

var AD_ORIENTATION_PORTRAIT = "p"
var AD_ORIENTATION_LANDSCAPE = "l"
var TOUCH_SUPPORT = 1
var NO_TOUCH_SUPPORT = 0
var ZOOM_FACTOR_NOT_APPLICABLE = -1.0

var DeviceRenditionParameters = function( screenWidth
                                        , screenHeight
                                        , requestedAdOrientation
                                        , touchSupport
                                        )
{

    this.sw = screenWidth   // Indicates screen width
    this.sh = screenHeight  // Indicates screen height

    // Requested ad orientation(p/l).
    // Value should be p when portrait, l when landscape
    // [Useful mainly for apps/games].
    // Even if you do not pass this value, Vserv will show the ad in
    // the correct orientation as per its best efforts.
    this.ro = requestedAdOrientation

    // Touch Support [If yes this should be set to ‘1’]
    this.ts = touchSupport

    // Zoom factor for the Web View [if applicable]
    this.zf = ZOOM_FACTOR_NOT_APPLICABLE

    this.sbd = StrictBannerDimensionValues.NO_STRICT_BANNER_DIMENSION
};

DeviceRenditionParameters.prototype =
{
    toUriParameters : function() {
        var params = UriHelper.addParameter("", "sw", this.sw)
        params = UriHelper.addParameter(params, "sh", this.sh)
        params = UriHelper.addParameter(params, "ro", this.ro)
        params = UriHelper.addParameter(params, "ts", this.ts)
        params = UriHelper.addParameterIfNotSpecialValue( params, "zf", this.zf
                                                         , ZOOM_FACTOR_NOT_APPLICABLE
                                                         )
        params = UriHelper.addParameterIfNotSpecialValue( params, "sbd", this.sbd
                                                        , StrictBannerDimensionValues.NO_STRICT_BANNER_DIMENSION
                                                        )
        return params
    },

    setZoomFactor : function( zoomFactor ) {
        this.zoomFactor = zoomFactor
    },

    // This is ‘strict banner dimension’ parameter. If this parameter is present,
    // Vserv will only returned the specified ad size OR would send back no-fill.
    // No attempt will be made to send a best-fit ad.
    //
    // Parameter only accepts values given in Appendix-D .
    // Passing any other value apart from the ones in the list would lead to no-fill
    //
    // NOTE: It is recommended to allow Vserv to pick the right ad based on device,
    // make, screen size etc. Use this parameter only for specific use cases
    setStrictBannerDimension : function( strictBannerDimension ) {
        this.strictBannerDimension = strictBannerDimension
    }
};
