*** Settings ***
Library      SeleniumLibrary
Variables    ../PageObjects/Locators.py
Resource     ../Resources/RegistrationKeywords.robot

*** Variables ***
${Browser}    chrome
${URL}        https://www.tutorialspoint.com/selenium/practice/register.php

*** Test Cases ***
RegistrationFormTest
    Open my Browser       ${URL}         ${Browser}
    Enter First_Name      Neha
    Enter Last_Name       Rajput
    Enter Username        Neha@gmail.com
    Enter Password        Neharaj@123456
    Click Register Button
    Close All Browsers