*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Login_resources.robot
Library     DataDriver    ../TestData/LoginData.CSV

Suite Setup    Open My Browser
Suite Teardown    Close Browsers
Test Template    Invalid Login

*** Test Cases ***
Login Test With Excel Using ${Username} ${Password}


*** Keywords ***
Invalid Login
    [Arguments]    ${Username}    ${Password}
    Input UserName     ${Username}
    Input Password     ${Password}
    Click Login Button
    Error message should be visible
