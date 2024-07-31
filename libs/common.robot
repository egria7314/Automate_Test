*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${URL}            https://www.way2automation.com/angularjs-protractor/webtables/
${ROWS_XPATH}     //tbody/tr


*** Keywords ***
Open Web Table Page
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${ROWS_XPATH}    10 seconds