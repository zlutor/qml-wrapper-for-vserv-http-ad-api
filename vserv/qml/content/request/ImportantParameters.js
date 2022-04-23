/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
.pragma library
.import "UriHelper.js" as UriHelper

/*
 Below section talks about the set of important parameters. Each of these parameters help Vserv understand more details about the environment/device features/ network / user demographics etc, thus opening up opportunities to serve a wider variety of ads with tailor made user experiences.
 While none of these parameters are mandatory to fetch an Ad, it is beneficial to  furnish as many as possible
*/
var ImportantParameters = function( deviceRenditionParameters /* DeviceRenditionParameters */
                                  , networkSimInformation /* NetworkSimInformation */
                                  , geoParameters /* GeoParameters */
                                  , userDemographics /* UserDemographics */
                                  )
{
    // Should hold the value of the cookie (Name: vcookieId).
    // The cookie should be set to the value as given by X-VSERV-VUID response header.
    // Refer to Appendix-A for further details
    this.deviceRenditionParameters = deviceRenditionParameters
    this.networkSimInformation = networkSimInformation
    this.geoParameters = geoParameters
    this.userDemographics = userDemographics
};

ImportantParameters.prototype =
{
    toUriParameters : function() {
        var params = ""
        params += this.deviceRenditionParameters.toUriParameters()
            + UriHelper.makeParametersIfAny((this.networkSimInformation.toUriParameters()))
            + UriHelper.makeParametersIfAny((this.geoParameters.toUriParameters()))
            + UriHelper.makeParametersIfAny((this.userDemographics.toUriParameters()))
        return params
    },

    /* private */ makeAdditional : function( parameter ){
        return UriHelper.EMPTY_VALUE !== parameter ? ("&" + parameter) : ""
    }
};
