*** Settings ***
Documentation    Test Demonstration
Library    SeleniumLibrary
Test Setup    Open the URL
Test TearDown    Close Browser
Resource    resource.robot
Test Template    loginstep



*** Variables ***
${TIME}       10
${USERNAME}    standard_user
${PWD}        secret_sauce

*** Test Cases ***
demoWebsite
                   username                password
Invalid Username    Demo1234          Test123456$
Invalid Password    Demo012           Test12344456
Invalid characters  abc@a             Test123456$
Invalid Test      standard_user      secret_sauce


*** Keywords ***
loginstep
    [Arguments]    ${username}    ${password}

    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIME}
    Sleep    2s
    Input Text    id:user-name    ${username}
    Input Text    id:password    ${password}
    Click element    //input[@id='login-button']
    ${alllinks}=    get element count    xpath://a
    log to console    ${alllinks}