*** settings ***
Library    SeleniumLibrary
Resource    ./Resource.robot
*** variables ***



*** Test Cases ***
RadioButton Check
#to get default selenium speed
    Open the URL
    ${speed}    Get Selenium Speed
    Log To Console    ${speed}
    maximize browser window

    #instead of setting sleep everywhere it is applied to every statement in step
    set selenium speed    2s

    #slecting radio button
    select radio button    gender    male

    #selection checkbox
    select checkbox    Automation
    select checkbox    Performance

    unselect checkbox    Automation
    close browser

    ${speed}    Get Selenium Speed
    Log To Console    ${speed}
