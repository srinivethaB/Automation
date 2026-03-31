*** Settings ***
Library      SeleniumLibrary
Library      ${CURDIR}/../Resource/ExcelReader.py
Resource     ${CURDIR}/../Resource/RegisterUserKeywords.robot

*** Variables ***
${Browser}         chrome
${SiteURL}         https://www.automationexercise.com/
${TestData}        ${CURDIR}/../TestData/Test_Data.xlsx
${LocatorFile}     ${CURDIR}/../TestData/Ecommerce_locators.xlsx

*** Test Cases ***

Run All Register User Test Cases From Excel
    ${testcase_ids}=    Get All Testcase Ids    ${TestData}

    FOR    ${tc_id}    IN    @{testcase_ids}
        Log To Console    \nRunning: ${tc_id}

        ${all_data}=    Get Test Data    ${TestData}    ${tc_id}

        FOR    ${row}    IN    @{all_data}
            Log To Console    Test ID: ${row}[test_id]

        # Step 1 & 2 - Open Browser and Navigate to URL
            Open My Browser    ${SiteURL}    ${Browser}

            # Step 3 - Verify Home Page is Visible
            Verify Home Page Is Visible    ${LocatorFile}

            # Step 4 - Click Signup / Login
            Click Signup Login Link    ${LocatorFile}

            # Step 5 - Verify New User Signup is Visible
            Verify New User Signup Is Visible

            # Step 6 - Enter Name and Email
            Enter Signup Name     ${row}[name]     ${LocatorFile}
            Enter Signup Email    ${row}[email]    ${LocatorFile}

            # Step 7 - Click Signup Button
            Click Signup Button    ${LocatorFile}

            # Step 8 - Verify Enter Account Information
            Verify Account Information Page Is Visible    ${LocatorFile}

            # Step 9 - Fill Title, Password, Date of Birth
            Select Title              ${row}[title]      ${LocatorFile}
            Enter Account Password    ${row}[password]   ${LocatorFile}
            Select Day Of Birth       ${row}[day]        ${LocatorFile}
            Select Month Of Birth     ${row}[month]      ${LocatorFile}
            Select Year Of Birth      ${row}[year]       ${LocatorFile}

            # Step 10 - Select Newsletter Checkbox
            Select Newsletter Checkbox    ${LocatorFile}

            # Step 11 - Select Special Offers Checkbox
            Select Special Offers Checkbox    ${LocatorFile}

            # Step 12 - Fill Address Details
            Enter First Name       ${row}[first_name]     ${LocatorFile}
            Enter Last Name        ${row}[last_name]      ${LocatorFile}
            Enter Company          ${row}[company]        ${LocatorFile}
            Enter Address1         ${row}[address1]       ${LocatorFile}
            Enter Address2         ${row}[address2]       ${LocatorFile}
            Select Country         ${row}[country]        ${LocatorFile}
            Enter State            ${row}[state]          ${LocatorFile}
            Enter City             ${row}[city]           ${LocatorFile}
            Enter Zipcode          ${row}[zipcode]        ${LocatorFile}
            Enter Mobile Number    ${row}[mobile_number]  ${LocatorFile}

            # Step 13 - Click Create Account Button
            Click Create Account Button    ${LocatorFile}

            # Step 14 - Verify Account Created
            Verify Account Created    ${LocatorFile}

            # Step 15 - Click Continue Button
            Click Continue Button    ${LocatorFile}

            # Step 16 - Verify Logged In As Username
            Verify Logged In As Username    ${LocatorFile}

            # Step 17 - Click Delete Account
            Click Delete Account Link    ${LocatorFile}

            # Step 18 - Verify Account Deleted and Click Continue
            Verify Account Deleted    ${LocatorFile}
            Click Continue Button     ${LocatorFile}

            Sleep    2s
            Close My Browsers
        END
    END
