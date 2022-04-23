.pragma library
.import "UriHelper.js" as UriHelper

/*
 * User/Device identifiers helps Vserv control the number of times a given ad
 * is shown to a user (frequency capping). It also allows user-level targeting
 * which ultimately leads to highly targeted ads and therefore higher income
 * for your publishers/developers
 */

var CriticalParameters = function( mobileAppIds
                                 , mobileSiteIds
                                 , iabcat
                                 )
{
    this.mobileAppIds = mobileAppIds
    this.mobileSiteIds = mobileSiteIds
    // IAB Category Number of the Site/App.
    // Refer to ‘6.1 Content Categories’ in the Open RTB Specification Document
    // http://www.iab.net/media/file/OpenRTB-API-Specification-Version-2-1-FINAL.pdf
    this.iabcat = iabcat
};

CriticalParameters.prototype =
{
    toUriParameters : function() {
        var params = ""
        params += this.mobileAppIds.toUriParameters()
            + UriHelper.makeParametersIfAny(this.mobileSiteIds.toUriParameters())
        params = UriHelper.addParameter(params, "iabcat", this.iabcat)
        return params
    }
};
