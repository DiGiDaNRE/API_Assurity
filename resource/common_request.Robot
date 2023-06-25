*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary    
Library    Collections

*** Keywords ***
Get Request
    [Arguments]    ${endpoint}
    ${Response}    RequestsLibrary.GET    ${endpoint}            #Using RequestLibrary's keyword GET request with a required parameter of an endpoint which is pass from testcase.    
    [Return]    ${Response.status_code},${Response.content}      #Return values of status code and api response to be use by other keywords.
        
Validate Succesful Response
    ${resp_code}    Convert To String     ${Response.status_code}
    Should Be Equal    ${resp_code}    200  
    
Validate element
    [Arguments]    ${JsonPath}    ${Compare}
    ${String}    Convert To String    ${Response.content}         #Retrieved value of API response is in bytes. Convert to String for the next process.
    ${Json}    Convert String to JSON    ${String}                #Using JSONlibrary converting string to Json for the next process
    ${Value}    Get Value From Json    ${Json}    ${JsonPath}     #Using JSONlibrary Retrieving specfic value defined by the JsonPath 
    ${StringElements}    Convert To String    ${Value}            #Retrieved element are converted to string to use in the next process
    Should Contain    ${StringElements}    ${Compare}              
