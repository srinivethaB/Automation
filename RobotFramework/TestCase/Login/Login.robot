*** Settings ***
Documentation    Test Demonstration
Library    SeleniumLibrary
Test Setup    Open the URL
Test TearDown    Close Browser
Resource    resource.robot



*** Variables ***
${TIME}       10
${USERNAME}    standard_user
${PWD}        secret_sauce

*** Test Cases ***
demoWebsite
    loginstep    ${USERNAME}    ${PWD}

*** Keywords ***
loginstep
    [Arguments]    ${USERNAME}    ${PWD}

    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIME}
    Sleep    2s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password    ${PWD}
    Click element    //input[@id='login-button']
    sleep    3s
    ${alllinks}=    get element count    xpath://a
    log to console    ${alllinks}