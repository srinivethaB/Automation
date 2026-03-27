*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
ScreenshotTestCase
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    Maximize Browser Window

    # Wait for login form to load
    Wait Until Element Is Visible    name=username    timeout=10s

    Input Text    name=username    Admin
    Input Text    name=password    admin123

    # Wait for logo image to fully render before screenshot
    Wait Until Element Is Visible    xpath://img[@alt='company-branding']    timeout=10s
    Sleep    2s

    # Capture element screenshot
    Capture Element Screenshot    xpath://img[@alt='company-branding']    C:/Users/Home/Desktop/TestProject/elementscreenshot.png

    # Capture full page screenshot
    Capture Page Screenshot    C:/Users/Home/Desktop/TestProject/pagescreenshot.png

    Close All Browsers
