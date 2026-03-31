*** Settings ***
Library      SeleniumLibrary
Library      ${CURDIR}/../Resources/ExcelReader.py
Resource     ${CURDIR}/../Resources/LoginKeywords.robot

*** Variables ***
${Browser}        chrome
${SiteURL}        https://www.saucedemo.com/
${TestData}       ${CURDIR}/../TestData/TestData.xlsx
${LocatorFile}    ${CURDIR}/../TestData/Locators.xlsx

*** Test Cases ***

Run All Test Cases From Excel
    ${testcase_names}=    Get All Testcase Names    ${TestData}

    FOR    ${tc_name}    IN    @{testcase_names}
        Log To Console    \nRunning: ${tc_name}

        ${all_data}=    Get Test Data    ${TestData}    ${tc_name}

        FOR    ${row}    IN    @{all_data}
            Log To Console    Iteration: ${row}[iteration]

            Open My Browser      ${SiteURL}    ${Browser}

            # ✅ Use LOCATOR FILE here
            ${username_locator}=    Get Locator    ${LocatorFile}    txt_loginUserName
            ${password_locator}=    Get Locator    ${LocatorFile}    txt_loginPassword
            ${login_button}=        Get Locator    ${LocatorFile}    btn_signIn

            Input Text    ${username_locator}    ${row}[username]
            Input Text    ${password_locator}    ${row}[password]
            Click Button  ${login_button}

            Sleep    2s
            Verify Successful Login
            Close My Browsers
        END
    END