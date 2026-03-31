*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Login_resources.robot
Suite Setup    Open My Browser    #execeutes only once beore execution of TestCases
Suite Teardown     Close Browsers    #executes only once after execution of TestCases
Test Template    Invalid Login    #executes for each Testcase


*** Variables ***

*** Test Cases ***       Username                 Password
Right user empty pwd     admin@yourstore.com      ${EMPTY}
Right user wrong pwd     admin@yourstore.com       xyz
Wrong user right pwd     ad@yourstore.com          admin
Wrong user empty pwd     ad@yourstore.com       ${EMPTY}
Wrong user wrong pwd     ad@yourstore.com           xyz



*** Keywords ***
Invalid Login
    [Arguments]    ${Username}    ${Password}
    Input UserName     ${Username}
    Input Password     ${Password}
    Click Login Button
    Error message should be visible



