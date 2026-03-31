*** Settings ***
Library     SeleniumLibrary
Library    ${CURDIR}/../Resource/ExcelReader.py

*** Keywords ***

Open My Browser
    [Arguments]     ${SiteURL}    ${Browser}
    Open Browser    ${SiteURL}    ${Browser}
    Maximize Browser Window

Close My Browsers
    Close All Browsers

Verify Home Page is Visible
    [Arguments]    ${locator_file}
    ${locator}=     Get Locator    ${locator_file}    HomePage_logo
    Element Should Be Visible    ${locator}

Click SignUp Login Link
    [Arguments]     ${locator_file}
    ${locator}=     Get Locator    ${locator_file}      Signup/Login
    Click Link    ${locator}

Verify New User SignUp is Visible
    Page Should Contain    New User Signup!

Enter SignUp Name
    [Arguments]     ${name}    ${locator_file}
    ${locator}=     Get Locator    ${locator_file}      SignUp_Name
    Input Text    ${locator}    ${name}

Enter SignUp Email
    [Arguments]     ${email}    ${locator_file}
    ${locator}=     Get Locator    ${locator_file}      SignUp_Email
    Input Text    ${locator}    ${email}

Click SignUp Button
    [Arguments]    ${locator_file}
    ${locator}=     Get Locator    ${locator_file}      SignUp_btn
    Click Button    ${locator}

Verify Account Information Page Is Visible
    [Arguments]    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    AccInfoHeading
    Element Should Be Visible    ${locator}

Select Title
    [Arguments]    ${title}    ${locator_file}
    IF    '${title}' == 'Mr'
        ${locator}=    Get Locator    ${locator_file}    gender_mr
    ELSE IF    '${title}' == 'Mrs'
        ${locator}=    Get Locator    ${locator_file}    gender_mrs
    END
    Click Element    ${locator}

Enter Account Password
    [Arguments]    ${password}    ${locator_file}
    ${locator}=     Get Locator    ${locator_file}    pwd
    Input Text    ${locator}    ${password}

Select Day Of Birth
    [Arguments]    ${day}    ${locator_file}
    ${locator}=     Get Locator    ${locator_file}    days_dropDown
    Select From List By Value    ${locator}    ${day}

Select Month Of Birth
    [Arguments]    ${month}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    month_dropDown
    Select From List By Label    ${locator}    ${month}

Select Year Of Birth
    [Arguments]    ${year}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    year_dropDown
    Select From List By Value    ${locator}    ${year}

Select Newsletter Checkbox
    [Arguments]    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    newsLetter_checkBox
    Click Element    ${locator}

Select Special Offers Checkbox
    [Arguments]    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    offerLetter_checkBox
    Click Element    ${locator}

Enter First Name
    [Arguments]    ${first_name}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    first_nameField
    Input Text    ${locator}    ${first_name}

Enter Last Name
    [Arguments]    ${last_name}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    last_nameField
    Input Text    ${locator}    ${last_name}

Enter Company
    [Arguments]    ${company}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    CompanyField
    Input Text    ${locator}    ${company}

Enter Address1
    [Arguments]    ${address1}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    address1_Field
    Input Text    ${locator}    ${address1}

Enter Address2
    [Arguments]    ${address2}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    address2_Field
    Input Text    ${locator}    ${address2}

Select Country
    [Arguments]    ${country}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    country_dropDown
    Select From List By Label    ${locator}    ${country}

Enter State
    [Arguments]    ${state}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    state_field
    Input Text    ${locator}    ${state}

Enter City
    [Arguments]    ${city}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    city_field
    Input Text    ${locator}    ${city}

Enter Zipcode
    [Arguments]    ${zipcode}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    zipcode_field
    Input Text    ${locator}    ${zipcode}

Enter Mobile Number
    [Arguments]    ${mobile}    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    mobilenumber_field
    Input Text    ${locator}    ${mobile}

Click Create Account Button
    [Arguments]    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    CreateAccount_btn
    Click Button    ${locator}

Verify Account Created
    [Arguments]    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    AccountCreated_txt
    Element Should Be Visible    ${locator}

Click Continue Button
    [Arguments]    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    Continue_btn
    Click Element    ${locator}

Verify Logged In As Username
    [Arguments]    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    Loggedin_Username
    Element Should Be Visible    ${locator}

Click Delete Account Link
    [Arguments]    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    DeleteAcc_Link
    Click Element    ${locator}


Verify Account Deleted
    [Arguments]    ${locator_file}
    ${locator}=    Get Locator    ${locator_file}    AccountDeleted_text
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Element Should Be Visible    ${locator}



