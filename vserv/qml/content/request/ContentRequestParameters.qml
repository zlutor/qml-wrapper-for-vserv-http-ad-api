import QtQuick 2.5
import "UriHelper.js" as UriHelper
/*
 * source: https://docs.google.com/document/d/139TRSTV33tLxKxbew4yPTPF4uc8PZJPiRkxyo9GymIE/edit
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
Item
{
    property alias mandatory: mandatoryParameters
    property alias critical : criticalParameters
    property alias important: importantParameters

    MandatoryParameters { id: mandatoryParameters }
    CriticalParameters  { id: criticalParameters }
    ImportantParameters { id: importantParameters }

    function makeRequest( requestUrl )
    {
        var request = requestUrl + "?"
                + mandatory.toUriParameters()
                + UriHelper.makeParametersIfAny(critical.toUriParameters())
                + UriHelper.makeParametersIfAny(important.toUriParameters())

        console.debug("request: ", request)
        return request;
    }
}

