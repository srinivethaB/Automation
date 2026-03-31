*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TableValidations
    Open Browser    https://testautomationpractice.blogspot.com/    chrome
    Maximize Browser Window

    #Get number of rows and columns in a table
    ${rows}=    get element count    xpath://table[@name='BookTable']/tbody/tr
    ${cols}=    Get Element Count    xpath://table[@name='BookTable']/tbody/tr[1]/th
    Log To Console    rows=${rows}, cols=${cols}

    #Get data from table
    ${data}=    Get Text    xpath://table[@name='BookTable']/tbody/tr[5]/td[1]
    Log To Console    ${data}

    #Validations
    #Verifying the column names of the table
    Table column Should Contain    xpath://table[@name='BookTable']    2    Author
                            #points complete table             #column number
    Table Row Should Contain    xpath://table[@name='BookTable']    4    Animesh
    
    Table Cell Should Contain    xpath://table[@name='BookTable']     5    2    Mukesh

    Table Header Should Contain    xpath://table[@name='BookTable']    BookName

