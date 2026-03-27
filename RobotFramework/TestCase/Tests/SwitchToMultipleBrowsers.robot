*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
MultipleBrowsersTestCase
    Open Browser    https://www.google.com/    chrome
    Maximize Browser Window

    sleep    3

    Open Browser    https://www.bing.com/    chrome
    Maximize Browser Window

    sleep   3

    Switch Browser    1
    ${title}    Get Title
    Log To Console    ${title}

    Switch Browser    2
    ${title}    Get Title
    Log To Console    ${title}

    Close All Browsers

