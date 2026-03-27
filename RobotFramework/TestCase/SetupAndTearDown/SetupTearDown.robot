*** Settings ***
Suite Setup    Log To Console    Opening Browser
Suite TearDown    Log To Console    Closing Browser

Test Setup    Log To Console    Login To Console
Test Teardown    Log To Console    Logout From Console

*** Test Cases ***
TC1 Prepaid Recharge
    Log To Console    This is prepaid recharge Testcase

TC2 Postpaid Recharge
    Log To Console    This is postpaid recharge Testcase

TC3 Search
    Log To Console    This is Search Testcase

TC4 Advanced Search
    Log To Console    This is Advanced Search Testcase

    