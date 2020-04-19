*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/custom_keywords.robot

*** Variables ***
${environment}  https://demo30-qa.acceleratelearning.com
${browser}  chrome
${teacher_credentials}  qa_teacher

*** Test Cases ***
Login as a Teacher
    login_as_a_teacher
    [Teardown]  close browser

Logout as a Teacher
    login_as_a_teacher
    wait until keyword succeeds    1min    10s    click element    //*[@id="root"]/div/header/div/div/div
    wait until keyword succeeds    1min    10s    click element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a
    wait until keyword succeeds    1min    10s    page should contain   Sign in to STEMscopes
    [Teardown]  close browser

