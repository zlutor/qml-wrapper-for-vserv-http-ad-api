/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
.pragma library
.import "UriHelper.js" as UriHelper

var UserDemographics = function( ageOfUser
                               , genderOfUser
                               , localeOrLanguageOfUser
                               , dateOfBirthOfUser
                               )
{
    this.ag = ageOfUser
    this.gn = genderOfUser
    this.lc = localeOrLanguageOfUser
    this.dob = dateOfBirthOfUser
};

UserDemographics.prototype =
{
    toUriParameters : function() {
        var params = UriHelper.addParameter("", "ag", this.ag)
        params = UriHelper.addParameter(params, "gn", this.gn)
        params = UriHelper.addParameter(params, "lc", this.lc)
        params = UriHelper.addParameter(params, "dob", this.dob)
        return params
    }
};

