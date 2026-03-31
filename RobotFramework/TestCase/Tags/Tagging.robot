*** Settings ***


*** Test Cases ***
#Tags=> to execute only particular testcases instead of executing every testcases
TC1 Prepaid Recharge
    [Tags]    Sanity
    Log To Console    This is prepaid recharge Testcase

TC2 Postpaid Recharge
    [Tags]    Regression
    Log To Console    This is postpaid recharge Testcase

TC3 Search
    [Tags]    [Regression]
    Log To Console    This is Search Testcase

TC4 Advanced Search
    [Tags]    Sanity
    Log To Console    This is Advanced Search Testcase

#to run give this command in terminal
#robot --include=sanity TestCase/Tags/Tagging.robot   (OR)
#robot --include=regression TestCase/Tags/Tagging.robot

#to include multiple testcases
#robot -i sanity regression TestCase/Tags/Tagging.robot
#-i means include

#to exclude
#robot -e sanity TestCase/Tags/Tagging.robot

#both include and exclude
#robot -e sanity -i Regression TestCase/Tags/Tagging.robot

