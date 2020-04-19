*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
${environment}  https://demo30-qa.acceleratelearning.com
${browser}  chrome
${teacher_credentials}  qa_teacher

*** Test Cases ***
Login as a Teacher
    open browser    ${environment}  ${browser}
    maximize browser window
    wait until keyword succeeds    1min    10s    input text    //*[@name='username']   ${teacher_credentials}
    wait until keyword succeeds    1min    10s    input text    //*[@name='password']   ${teacher_credentials}
    wait until keyword succeeds    1min    10s    click element    //*[@id="page_login"]/div[2]/form/div[3]/button
    wait until keyword succeeds    1min    10s    page should contain element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a
    [Teardown]  close browser

*** Keywords ***
