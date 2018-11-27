*** Settings ***
Documentation     Set Up keywords

Resource          ../../resources/general_configuration.robot
Library           Selenium2Library
Library           OperatingSystem

*** Keywords ***

Open Browser Window
    Set Selenium Configuration  ${DELAY}
    Open Browser  ${URL}  ${BROWSER}
    Run Keyword If  '${MAX_BROWSER}' == 'true'  Set Window Size  1920  1080

Set Selenium Configuration
    [Arguments]  ${delay_selenium}
    Set Selenium Speed  ${delay_selenium} seconds
