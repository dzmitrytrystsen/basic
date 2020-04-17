*** Settings ***
Documentation                                       This is basic test
Library                                             Selenium2Library

*** Variables ***

*** Test Cases ***
User can open login page
    [Documentation]                                 As a User I can open login page

    open browser                                    https://demo30-qa.acceleratelearning.com    chrome
    maximize browser window
    set selenium speed                              0
    [Teardown]    Title Should Be                                 Stemscopes Science




*** Keywords ***
