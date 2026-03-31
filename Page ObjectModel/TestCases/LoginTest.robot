*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/LoginKeywords.robot
            #This is a robot file => robot files areresource file.so path is given.
            #if it is python file we give variables


*** Variables ***
${Browser}    headLesschrome    #if i give headLess chrome i wont be able to see ui running all testing will be done at backend
${SiteURL}    https://www.saucedemo.com/
${UserName}    standard_user
${Password}    secret_sauce


*** Test Cases ***
LoginTest
    Open my Browser    ${SiteURL}    ${Browser}
    Enter UserName    ${UserName}
    Enter Password    ${Password}
    Click SignIn
    sleep    3s
    Verify Succesfull Login
    Close my Browsers
