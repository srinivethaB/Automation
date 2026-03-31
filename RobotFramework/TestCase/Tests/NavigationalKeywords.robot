*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
NavigationalTestCase
    Open Browser    https://google.com/    chrome
    ${location}    Get Location     #current url
    Log To Console    ${location}
    sleep    3

    Go To    https://bing.com/       #goes to new webpage
    ${location}    Get Location
    Log To Console    ${location}
    sleep    3

    Go Back       #goes to previous webpage(same like pressing back)
    ${location}    Get Location
    Log To Console    ${location}
    sleep    3



