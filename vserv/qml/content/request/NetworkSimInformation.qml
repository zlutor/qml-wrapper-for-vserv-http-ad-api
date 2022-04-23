/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
import "NetworkSimInformation.js" as Logic

Item
{
    property string countryCode       // Country Code. Refer to Appendix-C for additional information
    property string networkCode       // Network Code. Refer to Appendix-C for additional information
    property string cellSiteId        // Cell Site Id
    property string simOperator       // SIM Operator [Applicable on android phones]. Refer to Appendix-B for additional information
    property string networkOperator   // Network Operator [Applicable on android phones]. Refer to Appendix-B for additional information
    property string clientMSISDN      // Client MSISDN (mobile number)
    property string locationAreaCode

    function toUriParameters()
    {
        var helper = new Logic.NetworkSimInformation( countryCode
                                                    , networkCode
                                                    , cellSiteId
                                                    , simOperator
                                                    , networkOperator
                                                    , clientMSISDN
                                                    , locationAreaCode
                                                    )
        return helper.toUriParameters()
    }
}

