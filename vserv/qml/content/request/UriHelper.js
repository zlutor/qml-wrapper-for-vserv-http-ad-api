/*
 * Author: Zoltan Lutor (zoltan.lutor@gmail.com)
 *
 * Licence: completely free, us it as it is in any project you wish.
 *          mentioning author is welcome.
 *          no any guarantee, no any liability either...
 */
.pragma library

var EMPTY_VALUE = ""

/*
 @param uriParameters existing URI parameters
 @param parameterName name of parameter to be added
 @param parameterToBeAded new uri parameter to be added

 @return existing URI parameters expaneded with new URI parameter
         IF new one is not EMPTY_VALUE
*/
function addParameter( uriParameters, parameterName, parameterToBeAded )
{
//    console.debug("addParameter-uri-parameters: ", uriParameters)
//    console.debug("addParameter-parameter-name: ", parameterName)
//    console.debug("addParameter-parameter-value: '", parameterToBeAded, "'")

    if ( EMPTY_VALUE !== parameterToBeAded )
    {
        if( 0 !== uriParameters.length )
        {
            uriParameters += "&"
        }
        uriParameters += (parameterName + "=" + encodeURIComponent(parameterToBeAded))
    }

    //console.debug("addParameter-uri-parameters(2): ", uriParameters)
    return uriParameters
}

function addParameterIfNotSpecialValue( uriParameters
                                      , parameterName
                                      , parameterToBeAded
                                      , specialValue
                                      )
{
//    console.debug("addParameterIfNotSpecialValue-parameter-special-value: '", specialValue, "'")

    if ( specialValue !== parameterToBeAded )
    {
        return addParameter(uriParameters, parameterName, parameterToBeAded)
    }
    return uriParameters
}

function makeParametersIfAny( parameters )
{
    //console.debug("makeParametersIfAny-parameters: '", parameters, "'")

    return EMPTY_VALUE !== parameters
            ? ("&" + parameters)
            : ""
}
