*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TabbedWindowsTest
    Open browser    https://demo.automationtesting.in/Windows.html    chrome
    maximize browser window
    click element    xpath://a[@href='http://www.selenium.dev']//button[@class='btn btn-info'][normalize-space()='click']
    sleep    3s
    Switch Window    title=Selenium
    sleep    3s
    click element    xpath://span[normalize-space()='Projects']
    sleep    3s
    close all browsers
