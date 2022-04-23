/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
.pragma library

var STATUS_CODE_SuccessfulAdResponse    = "000"
var STATUS_CODE_NoFill                  = "001"
var STATUS_CODE_AdspotKeyMissing        = "M001"
var STATUS_CODE_UserAgentMissing        = "M002"
var STATUS_CODE_SourceParameterMissing  = "M003"

/*
API will provide JSON response in the following format:
{
"status":"STATUS_CODE",
"ad":"AD_MARKUP"
}
*/
var AdResponse = function( statusCode
                         , adMarkup
                         )
{
    // STATUS_CODE
    // 000:  Successful Ad response
    // 001:  No Fill
    // M001: adspot key missing
    // M002: user agent(ua) missing
    // M003: source parameter missing
    this.status = statusCode

    // Actual Mark up of ad - In HTML
    this.ad = adMarkup
}
