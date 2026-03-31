*** Settings ***
Library       SeleniumLibrary
Variables     ../PageObjects/Locators.py

*** Keywords ***
Open my Browser
    [Arguments]    ${SiteUrl}    ${Browser}
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

Enter UserName
    [Arguments]    ${username}
    Input Text    ${txt_loginUserName}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    ${txt_loginPassword}    ${password}

Click SignIn
    Click Button    ${btn_signIn}

Verify Succesfull Login
    Title Should Be    Swag Labs

Close my Browsers
    Close All Browsers