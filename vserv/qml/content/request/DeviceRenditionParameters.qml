/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
import "StrictBannerDimensionValues.js" as StrictBannerDimensionValues
import "DeviceRenditionParameters.js" as Logic

Item
{
    property string screenWidth   // Indicates screen width
    property string screenHeight  // Indicates screen height

    // Requested ad orientation(p/l).
    // Value should be "p" when portrait, "l" when landscape
    // [Useful mainly for apps/games].
    // Even if you do not pass this value, Vserv will show the ad in
    // the correct orientation as per its best efforts.
    property string requestedAdOrientation

    // Touch Support [If yes this should be set to "1"]
    property string touchSupport

    // Zoom factor for the Web View [if applicable]
    property string  zoomFactor : Logic.ZOOM_FACTOR_NOT_APPLICABLE

    property string  strictBannerDimensions : StrictBannerDimensionValues.NO_STRICT_BANNER_DIMENSION

    function toUriParameters()
    {
        var helper = new Logic.DeviceRenditionParameters( screenWidth
                                                        , screenHeight
                                                        , requestedAdOrientation
                                                        , touchSupport
                                                        )
        helper.setZoomFactor(zoomFactor)
        helper.setStrictBannerDimension(strictBannerDimensions)
        return helper.toUriParameters()
    }
}

