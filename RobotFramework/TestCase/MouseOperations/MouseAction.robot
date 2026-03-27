*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
MouseActionsTestCase
    Open Browser    https://swisnl.github.io/jQuery-contextMenu/demo.html    chrome
    Maximize Browser Window
    #Performs right click operation
    Open Context Menu    //span[@class='context-menu-one btn btn-neutral']
    sleep    3s


    #Double click action
    go to   https://testautomationpractice.blogspot.com/
    Maximize Browser Window
    Double Click Element    xpath://button[normalize-space()='Copy Text']
    sleep    3


    #Drag and Drop
    go to    https://vinothqaacademy.com/mouse-event/
    Maximize Browser Window
    Drag And Drop    id:dragItem    id:dropZone
    sleep    3

    Close Browser