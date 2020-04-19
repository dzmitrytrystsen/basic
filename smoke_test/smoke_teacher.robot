*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../resources/custom_keywords.robot

*** Variables ***
${environment}    https://demo30-qa.acceleratelearning.com
${browser}    chrome
${teacher_credentials}    qa_teacher
${new_password}    123456

*** Test Cases ***
Login as a Teacher
    login_as_a_teacher
    [Teardown]  close browser

Login with invalid credentials as a Teacher
    open browser    ${environment}  ${browser}
    maximize browser window
    ${random_username} =  Generate Random String  10  [NUMBERS]adcdefg
    wait until keyword succeeds    1min    5s    input text    //*[@name='username']   ${random_username}
    ${random_password} =  Generate Random String  10  [NUMBERS]adcdefg
    wait until keyword succeeds    1min    5s    input text    //*[@name='password']   ${random_password}
    wait until keyword succeeds    1min    5s    click element    //*[@id="page_login"]/div[2]/form/div[3]/button
    wait until keyword succeeds    1min    5s    page should contain   Invalid login or password
    [Teardown]  close browser

Logout as a Teacher
    login_as_a_teacher
    wait until keyword succeeds    1min    5s    click element    //*[@id="root"]/div/header/div/div/div
    wait until keyword succeeds    1min    5s    click element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a
    wait until keyword succeeds    1min    5s    page should contain   Sign in to STEMscopes
    [Teardown]  close browser

Change password as a Teacher
    login_as_a_teacher
    wait until keyword succeeds    15s    5s    click element    //*[@id="root"]/div/header/div/div
    wait until keyword succeeds    15s    5s    click element    //*[@title="Open Teacher Preferences Page"]
    ${new_password} =  Generate Random String  10  [NUMBERS]adcdefg
    wait until keyword succeeds    15s    5s    input text    //*[@name='password']   ${new_password}
    wait until keyword succeeds    15s    5s    input text    //*[@name='passwordConfirmation']   ${new_password}
    wait until keyword succeeds    15s    5s    click element    //*[@id="root"]/div/div/main/form/div[3]/button
    wait until keyword succeeds    15     5s    page should contain   Teacher Preferences are successfully updated
    wait until keyword succeeds    15s    5s    click element    //*[@id="root"]/div/header/div/div/div
    wait until keyword succeeds    15s    5s    click element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a
    wait until keyword succeeds    15s    5s    input text    //*[@name='username']   ${teacher_credentials}
    wait until keyword succeeds    15s    5s    input text    //*[@name='password']   ${new_password}
    wait until keyword succeeds    15s    5s    click element    //*[@id="page_login"]/div[2]/form/div[3]/button
    wait until keyword succeeds    15s    5s    page should contain element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a
    set_default_password_back
    wait until keyword succeeds    15s   5s    page should contain   Teacher Preferences are successfully updated
    [Teardown]  close browser