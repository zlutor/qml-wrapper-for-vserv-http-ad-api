/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
import "MobileSiteIds.js" as Logic

Item
{
    // Should hold the value of the cookie (Name: vcookieId).
    // The cookie should be set to the value as given by X-VSERV-VUID response header.
    // Refer to Appendix-A for further details
    property string vuid
    property string clientRequestURL

    function toUriParameters()
    {
        var helper = new Logic.MobileSiteIds( vuid, clientRequestURL)
        return helper.toUriParameters()
    }
}

