*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    DatabaseLibrary

Suite Setup        Run Keywords
...                Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPwd}    ${DBHost}    ${DBPort}
...                AND    Set Auto Commit    True
Suite Teardown     Disconnect From Database

*** Variables ***
${DBName}    mydb
${DBUser}    root
${DBPwd}     root
${DBHost}    127.0.0.1
${DBPort}    3306

*** Test Cases ***
#Create Person Table
    #${output}=    Execute SQL String    CREATE TABLE IF NOT EXISTS Person(id integer, first_name varchar(20), last_name varchar(20));
    #Log To Console    ${output}
    #Should Be Equal As Strings    ${output}    None

#Inserting Data in Person Table
#single record
    #${output}=    Execute SQL String    INSERT INTO Person Values(1,"Sri","Nivetha");
    #Log To Console    ${output}
    #Should Be Equal As Strings    ${output}    None

#multiple record
    #${output}=    Execute SQL Script    ${CURDIR}/../TestData/mydb_person_insertData.sql
    #Log To Console    ${output}
    #Should Be Equal As Strings    ${output}    None

Check If Data is present
#Verifying if a data (name or something) in present or not in person table
     check if exists in database    select id from mydb.person where first_name="John";

check if "Jio" recored not presnt in person table
    check if not exists in database    select id from mydb.person where first_name="Jio";

Check Person table exists in mydb database
    table must exist    person

Verify Row Count is 0
    row count is 0    select * from mydb.person where first_name="xyz";

Verify Row count is equal to some value
    row count is equal to x    select * from mydb.person where first_name="Sri";    3

Verify Row count is greater than some value
    row count is greater than x    select * from mydb.person where first_name="Sri";    2

Verify Row count is less than some value
    row count is less than x    select * from mydb.person where first_name="Sri";    4

Update record in person table
    ${output}=    Execute SQL String    update mydb.person set first_name="Kevin" where id=103;
    log to console    ${output}
    Should Be Equal As Strings    ${output}    None

Retrieve records from Person Table
    @{queryResults}=    query        select * from mydb.person;
    log to console     ${queryResults}

Delete records from person table
    Execute SQL String    delete from mydb.person;





