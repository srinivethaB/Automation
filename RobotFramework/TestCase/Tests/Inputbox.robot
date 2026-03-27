*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://www.saucedemo.com/

*** Test Cases ***
Inputbox test
    Open Browser    ${url}    ${browser}
    maximize browser window
    ${user_name}    set variable    id:user-name

    element should be visible    ${user_name}
    element should be enabled    ${user_name}

    input text    ${user_name}    JohnDavid@gmail.com
    Sleep    5s
    clear element text    ${user_name}
    Sleep    3s
    close browser


*** Keywords ***