*** Settings ***
Library    SeleniumLibrary
Library    String
Library    ${EXECDIR}/Resource/ExcelReader.py
Resource    ${CURDIR}/../Resource/CommonKeywords.robot

*** Keywords ***

Run Registration Flow
    [Arguments]    ${row}    ${url}    ${browser}    ${locator_file}

    Open My Browser    ${url}    ${browser}

    ${signup}=    Get Element    ${locator_file}    Signup/Login
    Wait And Click    ${signup}

    ${name_field}=    Get Element    ${locator_file}    SignUp_Name
    ${email_field}=   Get Element    ${locator_file}    SignUp_Email
    ${btn}=           Get Element    ${locator_file}    SignUp_btn

    Wait And Input    ${name_field}     ${row}[name]
    Wait And Input    ${email_field}    ${row}[email]
    Wait And Click    ${btn}

    ${expected_lower}=    Convert To Lowercase    ${row}[expected_result]

    IF    'account created' in $expected_lower
        # ── POSITIVE FLOW ──
        ${actual}=    Run Keyword And Return Status
        ...    Run Positive Flow    ${row}    ${locator_file}

        IF    ${actual}
            Log To Console    PASS | TC: ${row}[test_id] | Iter: ${row}[iteration]
        ELSE
            Close My Browsers
            Fail    TC ${row}[test_id] Iter ${row}[iteration] — Expected success but registration failed
        END

    ELSE
        # ── NEGATIVE FLOW ──
        ${error_visible}=    Run Keyword And Return Status
        ...    Run Negative Flow    ${row}

        IF    ${error_visible}
            Log To Console    PASS | TC: ${row}[test_id] | Iter: ${row}[iteration] | Error shown as expected
        ELSE
            Close My Browsers
            Fail    TC ${row}[test_id] Iter ${row}[iteration] — Expected error "${row}[expected_result]" not found on page
        END
    END

    Close My Browsers

Run Positive Flow
    [Arguments]    ${row}    ${file}

    ${pwd}=    Get Element    ${file}    pwd
    Wait And Input    ${pwd}    ${row}[password]

    ${title_lower}=    Convert To Lowercase    ${row}[title]
    IF    'mrs' in $title_lower
        ${title_locator}=    Get Element    ${file}    gender_mrs
    ELSE
        ${title_locator}=    Get Element    ${file}    gender_mr
    END
    Wait And Click    ${title_locator}

    ${dob_day}=    Get Element    ${file}    days_dropDown
    ${dob_month}=  Get Element    ${file}    month_dropDown
    ${dob_year}=   Get Element    ${file}    year_dropDown
    Select From List By Value    ${dob_day}      ${row}[day]
    Select From List By Label    ${dob_month}    ${row}[month]
    Select From List By Value    ${dob_year}     ${row}[year]

    ${fname}=    Get Element    ${file}    first_nameField
    ${lname}=    Get Element    ${file}    last_nameField
    ${addr}=     Get Element    ${file}    address1_Field
    ${state}=    Get Element    ${file}    state_field
    ${city}=     Get Element    ${file}    city_field
    ${zip}=      Get Element    ${file}    zipcode_field
    ${mobile}=   Get Element    ${file}    mobilenumber_field

    Wait And Input    ${fname}     ${row}[first_name]
    Wait And Input    ${lname}     ${row}[last_name]
    Wait And Input    ${addr}      ${row}[address1]
    Wait And Input    ${state}     ${row}[state]
    Wait And Input    ${city}      ${row}[city]
    Wait And Input    ${zip}       ${row}[zipcode]
    Wait And Input    ${mobile}    ${row}[mobile_number]

    ${create}=    Get Element    ${file}    CreateAccount_btn
    Wait And Click    ${create}

    Page Should Contain    Account Created!

Run Negative Flow
    [Arguments]    ${row}
    ${status}=    Run Keyword And Return Status
    ...    Page Should Contain    ${row}[expected_result]
    RETURN    ${status}
