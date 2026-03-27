*** Settings ***

Documentation    DropDownAlert
Library    SeleniumLibrary
Resource    ./Resource.robot

*** Variables ***



*** Test Cases ***
RadioButton and CheckBox
    Perform Click On Button

DropDown Elements
    Select Value

Alert Test
    Alert Click


*** Keywords ***
Perform Click on Button
    Open the URL
    sleep    2s
    Maximize Browser window
    click Element    xpath://input[@id='male']
    sleep    2s
    click Element    xpath://input[@value='Automation']
    sleep    2s

Select Value
    Select From List By Label    id:testingDropdown    Performance Testing
    sleep    2s
    Select From List By Index    id:testingDropdown    3
    sleep    2s

Alert Click
    Click Element    xpath://button[@onclick='generateAlertBox()']
    sleep    2s
    handle alert    accept
    sleep    3s