/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
import QtQuick 2.5
import "UserDemographics.js" as Logic
Item
{
    property string ageOfUser
    property string genderOfUser
    property string localeOrLanguageOfUser
    property string dateOfBirthOfUser

    function toUriParameters()
    {
        var helper = new Logic.UserDemographics( ageOfUser
                                               , genderOfUser
                                               , localeOrLanguageOfUser
                                               , dateOfBirthOfUser
                                               )
        return helper.toUriParameters()
    }
}

