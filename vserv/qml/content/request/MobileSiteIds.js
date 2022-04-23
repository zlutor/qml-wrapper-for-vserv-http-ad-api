/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
.pragma library
.import "UriHelper.js" as UriHelper

var MobileSiteIds = function( vuid
                            , clientRequestURL
                            )
{
    // Should hold the value of the cookie (Name: vcookieId).
    // The cookie should be set to the value as given by X-VSERV-VUID response header.
    // Refer to Appendix-A for further details
    this.vuid = vuid
    this.ru = clientRequestURL
};

MobileSiteIds.prototype =
{
    toUriParameters : function() {
        var params = UriHelper.addParameter("", "vuid",this.vuid)
        params = UriHelper.addParameter(params, "ru", this.ru)
        return params
    }
};
