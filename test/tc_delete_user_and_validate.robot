*** Settings ***
Documentation     Delete user and validate.
Library           SeleniumLibrary
Library           Collections
Library           ..\\pylibs\\CustomLibrary.py
Resource          ..\\libs\\common.robot


*** Variables ***
${URL}                   https://www.way2automation.com/angularjs-protractor/webtables/
${ROWS_XPATH}            //tbody/tr
${CELLS_XPATH}           ./td
${DELETE_BUTTON_XPATH}    //button[@class='btn btn-link' and @ng-click='delUser()']
${CONFIRM_OK_BUTTON_XPATH}    //button[text()='OK']
@{USER_TO_DELETE}        Mark    Novak    novak    ${EMPTY}    Company AAA    Customer    asa@asd.cz    777888444    ${EMPTY}    Edit    ${EMPTY}


*** Keywords ***
Delete User
    [Arguments]    ${user_data}
    ${all_texts}=    Retrieve Texts From Each Row    ${ROWS_XPATH}    ${CELLS_XPATH}
    Log To Console    All texts before deletion: ${all_texts}
    List Should Contain Value    ${all_texts}    ${user_data}
    ${row_index}=    Get Row Index From Table    ${all_texts}    ${user_data}
    Log To Console    Delete at Index: ${row_index}
    Click Button By Index    ${row_index}    ${DELETE_BUTTON_XPATH}
    Wait Until Element Is Visible    ${CONFIRM_OK_BUTTON_XPATH}    10 seconds
    Click Button    ${CONFIRM_OK_BUTTON_XPATH}


Verify User Deleted
    ${all_texts}=    Retrieve Texts From Each Row    ${ROWS_XPATH}    ${CELLS_XPATH}
    Log To Console    All texts after deletion: ${all_texts}
    List Should Not Contain Value    ${all_texts}    ${USER_TO_DELETE}


*** Test Cases ***  
Test Can Delete User
    [Documentation]    Delete user User Name: Novak and validate user has been deleted
    [Tags]    delete user
    Open Web Table Page
    Delete User    ${USER_TO_DELETE}
    Sleep    3s
    Verify User Deleted
    Close Browser