*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ScrollingTest
    Open Browser    https://www.countries-ofthe-world.com/flags-of-the-world.html    chrome
    Maximize Browser Window
    Execute Javascript    window.scrollTo(0,1500)
     #0 =>horizontal scroll, 1500=>vertical scroll

     Scroll Element Into View    xpath://td[normalize-space()='India']
     #scrolls untill element India is found

     Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
     #scrolls to end of the page

     Execute Javascript    window.scrollTo(0,-document.body.scrollHeight)
     #scrolls to starting  of the page


