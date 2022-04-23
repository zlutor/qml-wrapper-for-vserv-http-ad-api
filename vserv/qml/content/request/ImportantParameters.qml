import QtQuick 2.5
import "ImportantParameters.js" as Logic

/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
/*
 Below section talks about the set of important parameters.
 Each of these parameters help Vserv understand more details about
 the environment/device features/ network / user demographics etc,
 thus opening up opportunities to serve a wider variety of ads with
 tailor made user experiences.

 While none of these parameters are mandatory to fetch an Ad,
 it is beneficial to furnish as many as possible
*/

Item
{
    property alias deviceRenditionParameters : deviceRenditionParametersId
    property alias networkSimInformation : networkSimInformationId
    property alias geoParameters : geoParametersId
    property alias userDemographics : userDemographicsId

    DeviceRenditionParameters   { id : deviceRenditionParametersId }
    NetworkSimInformation       { id : networkSimInformationId }
    GeoParameters               { id : geoParametersId }
    UserDemographics            { id : userDemographicsId }

    function toUriParameters()
    {
        var helper = new Logic.ImportantParameters( deviceRenditionParameters
                                                  , networkSimInformation
                                                  , geoParameters
                                                  , userDemographics
                                                  )
        return helper.toUriParameters()
    }
}

