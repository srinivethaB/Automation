*** Settings ***
Library     SeleniumLibrary
Library     ${EXECDIR}/Resource/ExcelReader.py
Library     allure_robotframework
Resource    ${CURDIR}/../Resource/RegisterUserKeywords.robot

*** Variables ***
${URL}              https://automationexercise.com
${BROWSER}          chrome
${LOCATOR_FILE}     ${EXECDIR}/TestData/SignUpRegister_locators.xlsx
${DATA_FILE}        ${EXECDIR}/TestData/SignUpRegisterData.xlsx

*** Keywords ***

Run Single Iteration
    [Arguments]    ${tc_id}    ${iteration}
    ${all_data}=    Get Test Data    ${DATA_FILE}    ${tc_id}
    ${index}=       Evaluate    int(${iteration}) - 1
    ${row}=         Set Variable    ${all_data}[${index}]
    Run Registration Flow    ${row}    ${URL}    ${BROWSER}    ${LOCATOR_FILE}

*** Test Cases ***

TC_001 - Register User With Valid Data - Iter 1
    [Tags]           positive    TC_001    iteration-1
    [Documentation]  TC_001 | Iter 1 | Expected: Account created successfully
    Run Single Iteration    TC_001    1

TC_001 - Register User With Valid Data - Iter 2
    [Tags]           positive    TC_001    iteration-2
    [Documentation]  TC_001 | Iter 2 | Expected: Account created successfully
    Run Single Iteration    TC_001    2

TC_001 - Register User With Valid Data - Iter 3
    [Tags]           positive    TC_001    iteration-3
    [Documentation]  TC_001 | Iter 3 | Expected: Account created successfully
    Run Single Iteration    TC_001    3

TC_002 - Register User With Invalid Name - Iter 1
    [Tags]           negative    TC_002    iteration-1
    [Documentation]  TC_002 | Iter 1 | Expected: Error: Please fill out this field
    Run Single Iteration    TC_002    1

TC_002 - Register User With Invalid Name - Iter 2
    [Tags]           negative    TC_002    iteration-2
    [Documentation]  TC_002 | Iter 2 | Expected: Error: Name too short
    Run Single Iteration    TC_002    2

TC_002 - Register User With Invalid Name - Iter 3
    [Tags]           negative    TC_002    iteration-3
    [Documentation]  TC_002 | Iter 3 | Expected: Error: Invalid Name format
    Run Single Iteration    TC_002    3

TC_003 - Register User With Invalid Email - Iter 1
    [Tags]           negative    TC_003    iteration-1
    [Documentation]  TC_003 | Iter 1 | Expected: Error: Please include @
    Run Single Iteration    TC_003    1

TC_003 - Register User With Invalid Email - Iter 2
    [Tags]           negative    TC_003    iteration-2
    [Documentation]  TC_003 | Iter 2 | Expected: Error: Please include @
    Run Single Iteration    TC_003    2

TC_003 - Register User With Invalid Email - Iter 3
    [Tags]           negative    TC_003    iteration-3
    [Documentation]  TC_003 | Iter 3 | Expected: Error: Email Address already exist!
    Run Single Iteration    TC_003    3

TC_004 - Register User With Invalid Password - Iter 1
    [Tags]           negative    TC_004    iteration-1
    [Documentation]  TC_004 | Iter 1 | Expected: Error: Password too weak
    Run Single Iteration    TC_004    1

TC_004 - Register User With Invalid Password - Iter 2
    [Tags]           negative    TC_004    iteration-2
    [Documentation]  TC_004 | Iter 2 | Expected: Error: Must contain letters & numbers
    Run Single Iteration    TC_004    2

TC_004 - Register User With Invalid Password - Iter 3
    [Tags]           negative    TC_004    iteration-3
    [Documentation]  TC_004 | Iter 3 | Expected: Error: Please fill out this field
    Run Single Iteration    TC_004    3

TC_005 - Register User With Missing Mandatory Fields - Iter 1
    [Tags]           negative    TC_005    iteration-1
    [Documentation]  TC_005 | Iter 1 | Expected: Error: All mandatory fields required
    Run Single Iteration    TC_005    1

TC_005 - Register User With Missing Mandatory Fields - Iter 2
    [Tags]           negative    TC_005    iteration-2
    [Documentation]  TC_005 | Iter 2 | Expected: Error: Please fill out this field
    Run Single Iteration    TC_005    2

TC_005 - Register User With Missing Mandatory Fields - Iter 3
    [Tags]           negative    TC_005    iteration-3
    [Documentation]  TC_005 | Iter 3 | Expected: Error: Please fill out this field
    Run Single Iteration    TC_005    3
