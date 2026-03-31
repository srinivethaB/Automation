*** Settings ***
Library    SeleniumLibrary

*** variables ***


*** Test Cases ***
MyTestCase
    open browser    https://www.saucedemo.com/    chrome
    maximize browser window

    open browser    https://artoftesting.com/samplesiteforselenium    chrome
    maximize browser window

    close all browsers
    #closes all the browsers

*** Keywords ***


