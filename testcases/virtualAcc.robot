*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
Login To Deriv
    Open Browser    https://app.deriv.com/    chrome 
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    30
    Input Text    //input[@type='email']    akmal.hakim+3@besquare.com.my
    Input Text    //input[@type='password']    Test1234  
    Click Element    //button[@type='submit']
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    dt_core_account-info_acc-info    30

Change To Virtual Account
    Set Selenium Speed    0.5 seconds
    Click Element    //div[@id='dt_core_account-info_acc-info']
    Wait Until Page Contains Element    dt_core_account-switcher_demo-tab    30
    Click Element    //*[@id="dt_core_account-switcher_demo-tab"]
    Wait Until Page Contains Element    //*[@class="acc-switcher__id"]    30
    Click Element    //*[@class="acc-switcher__id"]
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    //*[@class='acc-info acc-info--is-virtual']    30