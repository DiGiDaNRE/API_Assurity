*** Settings ***
Resource    ../resource/common_request.Robot    

*** Variables ***
${endpoint}   https://api.tmsandbox.co.nz/v1/Categories/${CategoryID}/Details.json?catalogue=${catalogue} 
${categoryID}    6329
${catalogue}    false

*** Test Cases ***
Validate element -Name- is equal to -Home and Garden-
    Get Request    ${endpoint}
    Validate Succesful Response                    #Validating API response is 200
    Validate element    $.Name    Home & garden    #Required parameter are the JsonPath for the specific element to validate and the value to compare with the API response    

Validate element -CanRelist- is set to true
    Get Request    ${endpoint}
    Validate Succesful Response
    Validate element    $.CanRelist    True    

Validate Promotions element with Name -Feature- has a Description that contains the text -Better position in category-
    Get Request    ${endpoint}
    Validate Succesful Response
    Validate element    $.Promotions[2].Name,Description      'Feature', 'Better position in category'