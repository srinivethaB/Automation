*** Settings ***
Library       SeleniumLibrary
Library       ../Resources/ExcelReader.py
#Variables     ../PageObjects/Locators.py

*** Keywords ***
Open my Browser
    [Arguments]    ${SiteUrl}    ${Browser}
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

Enter UserName
    [Arguments]    ${username}    ${file}
    ${locator}=    Get Locator    ${file}    txt_loginUserName
    Input Text    ${locator}    ${username}

Enter Password
    [Arguments]    ${password}    ${file}
    ${locator}=    Get Locator    ${file}    txt_loginPassword
    Input Text    ${locator}    ${password}

Click SignIn
    [Arguments]    ${file}
    ${locator}=    Get Locator    ${file}    btn_signIn
    Click Button    ${locator}

Verify Successful Login
    Title Should Be    Swag Labs

Close my Browsers
    Close All Browsers