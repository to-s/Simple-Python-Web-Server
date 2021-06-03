*** Settings ***
Test Setup        Open Browser    http://127.0.0.1:8080
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${WAITFORTAG}     tag:h1

*** Test Cases ***
Check localhost
    Wait for localhost
    Save content

*** Keywords ***
Wait for localhost
    Wait Until Page Contains Element    ${WAITFORTAG}

Save content
    ${text}    Get Text    ${WAITFORTAG}
    Log To Console    ${text}
    Append To File    result.txt    ${text}
