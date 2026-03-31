*** Settings ***
Documentation    Test case to execute the login process
Library    SeleniumLibrary



*** Variables ***
${URL}        https://artoftesting.com/samplesiteforselenium
${BROWSER}    chrome

*** Keywords ***

Open the URL
    Open Browser    ${URL}    ${BROWSER}