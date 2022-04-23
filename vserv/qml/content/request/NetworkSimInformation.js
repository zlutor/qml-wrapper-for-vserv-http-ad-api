/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
.pragma library
.import "UriHelper.js" as UriHelper

var NetworkSimInformation = function( countryCode
                                    , networkCode
                                    , cellSiteId
                                    , simOperator
                                    , networkOperator
                                    , clientMSISDN
                                    , locationAreaCode
                                    )
{
    this.cc = countryCode       // Country Code. Refer to Appendix-C for additional information
    this.nc = networkCode       // Network Code. Refer to Appendix-C for additional information
    this.ce = cellSiteId        // Cell Site Id
    this.so = simOperator       // SIM Operator [Applicable on android phones]. Refer to Appendix-B for additional information
    this.no = networkOperator   // Network Operator [Applicable on android phones]. Refer to Appendix-B for additional information
    this.mo = clientMSISDN      // Client MSISDN (mobile number)
    this.lac = locationAreaCode // Location Area Code
};

NetworkSimInformation.prototype =
{
    toUriParameters : function() {
        var params = UriHelper.addParameter("", "cc", this.cc)
        params = UriHelper.addParameter(params, "nc", this.nc)
        params = UriHelper.addParameter(params, "ce", this.ce)
        params = UriHelper.addParameter(params, "so", this.so)
        params = UriHelper.addParameter(params, "nc", this.no)
        params = UriHelper.addParameter(params, "mo", this.mo)
        params = UriHelper.addParameter(params, "lac", this.lac)
        return params
    }
};
