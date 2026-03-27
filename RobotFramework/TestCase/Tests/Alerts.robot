*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
HandlingAlerts

    open browser    https://testautomationpractice.blogspot.com/    chrome
    maximize browser window
    click element    xpath://button[@id='confirmBtn']
    sleep    3s
    #handle alert    accept
    #handle alert    dismiss
    #handle alert    leave
    #just leaves does not accept or dismiss

    #alert should be present    Press a button!
    #to verify the presence of that sentence in alert box

    alert should not be present    Press a button!