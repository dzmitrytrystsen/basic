*** Keywords ***
login_as_a_teacher
    open browser    ${environment}  ${browser}
    maximize browser window
    wait until keyword succeeds    1min    5s    input text    //*[@name='username']   ${teacher_credentials}
    wait until keyword succeeds    1min    5s    input text    //*[@name='password']   ${teacher_credentials}
    wait until keyword succeeds    1min    5s    click element    //*[@id="page_login"]/div[2]/form/div[3]/button
    wait until keyword succeeds    1min    5s    page should contain element    //*[@id="root"]/div/header/div/div/div/div[3]/div/div/div[1]/ul/li[3]/a

set_default_password_back
    wait until keyword succeeds    15s    5s    click element    //*[@id="root"]/div/header/div/div
    wait until keyword succeeds    15s    5s    click element    //*[@title="Open Teacher Preferences Page"]
    wait until keyword succeeds    15s    5s    input text    //*[@name='password']   ${teacher_credentials}
    wait until keyword succeeds    15s    5s    input text    //*[@name='passwordConfirmation']   ${teacher_credentials}
    wait until keyword succeeds    15s    5s    click element    //*[@id="root"]/div/div/main/form/div[3]/button
