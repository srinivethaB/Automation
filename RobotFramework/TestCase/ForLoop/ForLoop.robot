*** Settings ***
Library    OperatingSystem
*** Test Cases ***

ForLoop1
    FOR    ${i}     IN RANGE    1    10         #in range takes only two values(start,end)
        log to console    ${i}
    END

ForLoop2
    FOR    ${i}     IN     1 2 3 4 5 6 7 8 9 10
        log to console    ${i}
    END

ForLoop3
    FOR    ${i}    IN RANGE    1    10
        log to console     ${i}      no_newline=True
    END

ForLoop4WithList
    @{item}    create list     1   2   3   4
    FOR    ${i}     IN     @{item}
    log to console    ${i}
    END


ForLoop5
    FOR    ${i}    IN    JOHN    DAVID    SMITH
    Log To Console    ${i}
    END

ForLoop6
    @{item_list}    create list    JOHN    DAVID    SMITH
    FOR    ${i}    IN    @{item_list}
    Log To Console    ${i}
    END

ForLoop7WithExit
    @{items}     create list    1    2    3    4    5
    FOR    ${i}    IN    @{items}
    Log To Console    ${i}
    Exit For Loop If    ${i}==3
    END
