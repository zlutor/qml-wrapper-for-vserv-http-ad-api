/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
import "GeoParameters.js" as Logic

Item
{
    property string latitude
    property string longitude

    function toUriParameters()
    {
        var helper = new Logic.GeoParameters( latitude, longitude )
        return helper.toUriParameters()
    }
}

