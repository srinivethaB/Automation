*** settings ***
Library    SeleniumLibrary

*** variables ***
${browser}    chrome
${url}    https://artoftesting.com/samplesiteforselenium


*** Test Cases ***
RadioButton Check
    open browser    ${url}    ${browser}
    maximize browser window

    #to get default time out(waiting time)
    ${timeout}    get selenium timeout
    log to console    ${timeout}


    set selenium timeout    10seconds
    #if we want to change the default wait time of 5 seconds to 10seconds

    wait until page contains    ArtOfTesting
    #default wait time 5 seconds after that if it is not present it throws error

    #slecting radio button
    select radio button    gender    male

    #selection checkbox
    select checkbox    Automation
    select checkbox    Performance

    unselect checkbox    Automation
    close browser

    ${speed}    Get Selenium Speed
    Log To Console    ${speed}