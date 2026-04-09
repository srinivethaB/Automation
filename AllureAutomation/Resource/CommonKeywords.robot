*** Settings ***
Library    SeleniumLibrary
Library    String
Library    ${EXECDIR}/Resource/ExcelReader.py

*** Keywords ***

Open My Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Close My Browsers
    Close All Browsers

Get Element
    [Arguments]    ${file}    ${name}
    ${locator}=    Get Locator    ${file}    ${name}
    Should Not Be Equal    ${locator}    ${None}
    RETURN    ${locator}

Wait And Input
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}    10s
    Input Text    ${locator}    ${value}

Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Click Element    ${locator}
