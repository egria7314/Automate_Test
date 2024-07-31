*** Settings ***
Documentation     Add user and validate.
Library           SeleniumLibrary
Library           Collections
Library           ..\\pylibs\\CustomLibrary.py
Resource          ..\\libs\\common.robot

*** Variables ***
# ${ROWS_XPATH}   //tbody/tr
# ${CELLS_XPATH}  ./td
# ${DELETE_BUTTON_XPATH}    //button[@class='btn btn-link' and @ng-click='delUser()']
# ${ROW_INDEX}    4
${URL}            https://www.way2automation.com/angularjs-protractor/webtables/
${ROWS_XPATH}     //tbody/tr
${CELLS_XPATH}    ./td
${DELETE_BUTTON_XPATH}    //button[@class='btn btn-link' and @ng-click='delUser()']
${NEW_USER}       Danny
${NEW_USER_EMAIL}    danny@comp.com
${NEW_USER_PHONE}    111222333
@{EXPECTED_ROW}    Danny    Danny    Danny    ${EMPTY}    ${EMPTY}    Sales Team    danny@comp.com    111222333    ${EMPTY}    Edit    ${EMPTY}


*** Keywords ***
Add User
    Click Button    xpath=//button[text()=' Add User']
    Wait Until Page Contains Element    xpath=//input[@type="text" and @name="FirstName"]    10 seconds
    Input Text    xpath=//input[@type="text" and @name="FirstName"]    ${NEW_USER}
    Input Text    xpath=//input[@type="text" and @name="LastName"]    ${NEW_USER}
    Input Text    xpath=//input[@type="text" and @name="UserName"]    ${NEW_USER}
    Select From List By Index    xpath=//select[@name='RoleId']    1
    Input Text    xpath=//input[@type="email" and @name="Email"]    ${NEW_USER_EMAIL}
    Input Text    xpath=//input[@type="text" and @name="Mobilephone"]    ${NEW_USER_PHONE}
    Click Button    xpath=//button[text()='Save']
    Wait Until Page Contains Element    ${ROWS_XPATH}    10 seconds

Verify User Added
    ${all_texts}=    Retrieve Texts From Each Row    ${ROWS_XPATH}    ${CELLS_XPATH}
    Log To Console    My expected row: ${EXPECTED_ROW}
    Log To Console    All rows: ${all_texts}
    List Should Contain Value    ${all_texts}    ${EXPECTED_ROW}


*** Test Cases ***
Test Can Add User
    [Documentation]    Add a user and validate the user has been added to the table
    [Tags]    add user
    Open Web Table Page
    Add User
    Sleep    3s
    Verify User Added
    Close Browser