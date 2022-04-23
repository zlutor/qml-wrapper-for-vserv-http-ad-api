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
  Passing latitude/longitude information enables city/region targeted ads
  on your inventory
*/

var GeoParameters = function( latitude
                            , longitude
                            )
{
    this.lat = latitude
    this.lon = longitude
};

GeoParameters.prototype =
{
    toUriParameters : function() {
        var params = UriHelper.addParameter("", "lat", this.lat)
        params = UriHelper.addParameter(params, "lon", this.lon)
        return params
    }
};
