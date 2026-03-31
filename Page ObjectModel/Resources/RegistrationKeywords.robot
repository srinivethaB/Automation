*** Settings ***
Library      SeleniumLibrary
Variables    ../PageObjects/Locators.py

*** Keywords ***
Open my Browser
    [Arguments]    ${SiteUrl}    ${Browser}
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

Enter First_Name
    [Arguments]    ${firstName}
    Wait Until Element Is Visible    ${txt_firstName}    timeout=10s
    Input Text    ${txt_firstName}    ${firstName}

Enter Last_Name
    [Arguments]    ${lastName}
    Input Text    ${txt_lastName}    ${lastName}

Enter Username
    [Arguments]    ${UserName}
    Input Text    ${txt_userName}    ${UserName}

Enter Password
    [Arguments]    ${Password}
    Input Text    ${txt_password}    ${Password}

Click Register Button
    Click Button    ${btn_register}