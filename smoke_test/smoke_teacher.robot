*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/custom_keywords.robot

*** Variables ***
${environment}  https://demo30-qa.acceleratelearning.com
${browser}  chrome
${teacher_credentials}  qa_teacher
${new_password} 123456

*** Test Cases ***
Login as a Teacher
    login_as_a_teacher
    [Teardown]  close browser

Logout as a Teacher
    login_as_a_teacher
    wait until keyword succeeds    1min    5s    click element    //*[@id="root"]/div/header/div/div/div
    wait until keyword succeeds    1min    5s    click element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a
    wait until keyword succeeds    1min    5s    page should contain   Sign in to STEMscopes
    [Teardown]  close browser

Change password as a Teacher
    login_as_a_teacher
    wait until keyword succeeds    1min    5s    click element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a
    wait until keyword succeeds    1min    5s    click element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[2]/a
    wait until keyword succeeds    1min    5s    input text    //*[@name='password']   ${new_password}
    wait until keyword succeeds    1min    5s    input text    //*[@name='passwordConfirmation']   ${new_password}
    wait until keyword succeeds    1min    5s    click element    //*[@id="root"]/div/div/main/form/div[3]/button
    wait until keyword succeeds    1min    5s    click element    //*[@id="root"]/div/header/div/div/div
    wait until keyword succeeds    1min    5s    click element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a
    wait until keyword succeeds    1min    5s    input text    //*[@name='username']   ${teacher_credentials}
    wait until keyword succeeds    1min    5s    input text    //*[@name='password']   ${new_password}
    wait until keyword succeeds    1min    5s    page should contain element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a
    [Teardown]  close browser