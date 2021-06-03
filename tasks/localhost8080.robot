*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           OperatingSystem
Library           Process

*** Variables ***
${LOCALHOST}
${DEFAULT_LOCALHOST}    127.0.0.1
${WAITFORTAG}     tag:h1

*** Test Cases ***
Check localhost
    Check IP setting
    Wait for localhost
    Save content

*** Keywords ***
Wait for localhost
    Run Keyword If    '${LOCALHOST}' == ''    Set Test Variable    ${LOCALHOST}    ${DEFAULT_LOCALHOST}
    Open Browser    http://${LOCALHOST}:8080
    Wait Until Page Contains Element    ${WAITFORTAG}

Save content
    ${text}    Get Text    ${WAITFORTAG}
    Log To Console    ${text}
    Append To File    content.txt    ${text}

Check IP setting
    ${result} =    Run Process    ip    addr
    Log To Console    ${result.stdout}
