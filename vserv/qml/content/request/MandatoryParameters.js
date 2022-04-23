/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
.pragma library
.import "UriHelper.js" as UriHelper

var MandatoryParameters = function( adspot, ua, source, tm )
{
    //-----------------------------------------------------------------------
    // Must be present in every ad request
    //-----------------------------------------------------------------------

    // Alphanumeric zone key from your Vserv account.
    // [E.g. dgss139] This is the single most important parameter in the API call.
    // Adspot/Zone settings govern the Ad size [Banner / Full Screen],
    // Environment [Mobile Apps / Mobile Sites],
    // Ad media [Whether rich media ads are allowed],
    // Allowed advertiser categories and so on...

    this.adspot = adspot

    // Requesting device (Client) User-Agent
    this.ua = ua

    // The site/app identification.  For e.g. HTTP header HOST (for sites) / Packagename / Bundle identifier / Product ID (for apps)
    this.source = source

    // Indicates Test mode [Test mode set to '1']
    this.tm = tm

    //-----------------------------------------------------------------------
    // Mandatory parameters for Server to Server Integrations
    // If you are using this API to fetch Vserv ads from server2server and not from the mobile device / SDK, the below parameters are additionally mandatory
    //-----------------------------------------------------------------------
    /* mandatory s2s*/this.ip = UriHelper.EMPTY_VALUE // Client originating IP address
    /* mandatory s2s*/this.ff = UriHelper.EMPTY_VALUE // Client Request HTTP header X-FORWARDED-FOR HTTP [If received]
    /* mandatory s2s*/this.hv = UriHelper.EMPTY_VALUE // Client Request HTTP header VIA [If received]
};

MandatoryParameters.prototype =
{
    setServer2ServerParameters : function( ip, ff, hv ) {
        this.ip = ip
        this.ff = ff
        this.hv = hv
    },

    toUriParameters : function() {
        var params = UriHelper.addParameter("", "adspot", this.adspot)
        params = UriHelper.addParameter(params, "ua", this.ua)
        params = UriHelper.addParameter(params, "source", this.source)
        params = UriHelper.addParameter(params, "tm", this.tm)

        // optional server params
        params = UriHelper.addParameter(params, "ip", this.ip)
        params = UriHelper.addParameter(params, "ff", this.ff)
        params = UriHelper.addParameter(params, "hv", this.hv)
        return params
    }
};
