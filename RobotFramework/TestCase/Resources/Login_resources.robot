*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://admin-demo.nopcommerce.com
${browser}    chrome

*** Keywords ***
Open My Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Close Browsers
    Close All Browsers

Open LoginPage
    Go To    ${url}

Input UserName
    [Arguments]    ${Username}
    Input Text    id:Email    ${Username}

Input Password
    [Arguments]    ${Password}
    Input Text    id:Password    ${Password}

Click Login Button
    Click Element    xpath://button[@type='submit']

Click Logout Link
    Click Link    xpath://a[normalize-space()='Logout']

Error message should be visible
    Page Should Contain    Login was unsuccessful

Home Page should be visible
    Page Should Contain    Dashboard


