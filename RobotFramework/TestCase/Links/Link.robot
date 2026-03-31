*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Test Cases ***
GetAllLinksTest
    Open Browser    https://demoqa.com/links    chrome
    ${Link_count}=    SeleniumLibrary.Get Element Count    xpath://a
    Log To Console    Total Links: ${Link_count}

    FOR    ${i}    IN RANGE    1    ${Link_count}+1
        ${Link_text}=    Get Text    xpath:(//a)[${i}]
        Log To Console    ${Link_text}
    END
