*** settings ***
Library    SeleniumLibrary

*** variables ***
${browser}    chrome
${url}    https://artoftesting.com/samplesiteforselenium


*** Test Cases ***
RadioButton Check
    open browser    ${url}    ${browser}
    maximize browser window

    #to get default implicit wait
    ${implicit_wait}    get selenium implicit wait
    log to console    ${implicit_wait}

    #it is also applied to all statements wait(10s) until it finds if not found throes error
    set selenium implicit wait    10s

    ${implicit_wait}    get selenium implicit wait
    log to console    ${implicit_wait}

    #slecting radio button
    select radio button    gender    mal

    #selection checkbox
    select checkbox    Automation
    select checkbox    Performance

    unselect checkbox    Automation
    close browser

    ${speed}    Get Selenium Speed
    Log To Console    ${speed}