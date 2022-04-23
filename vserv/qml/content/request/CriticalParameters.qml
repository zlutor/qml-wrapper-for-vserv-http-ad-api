import QtQuick 2.5
import "CriticalParameters.js" as Logic

/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
Item
{
    property alias mobileAppIds : mobileAppIdParams
    property alias mobileSiteIds : mobileSiteIdParams
    // IAB Category Number of the Site/App.
    // Refer to ‘6.1 Content Categories’ in the Open RTB Specification Document
    // http://www.iab.net/media/file/OpenRTB-API-Specification-Version-2-1-FINAL.pdf
    property string iabcat

    MobileAppIds { id: mobileAppIdParams }
    MobileSiteIds { id: mobileSiteIdParams }

    function toUriParameters()
    {
        var helper = new Logic.CriticalParameters(mobileAppIds, mobileSiteIds, iabcat)
        return helper.toUriParameters()
    }
}

