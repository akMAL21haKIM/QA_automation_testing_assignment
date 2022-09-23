*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${email}    //input[@type='email']
${password}    //input[@type='password']

*** Test Cases ***
Login To Deriv
    Open Browser    https://app.deriv.com/    chrome 
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    30
    Input Text    //input[@type='email']    ${email}
    Input Text    //input[@type='password']    ${password}    
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

Change To Volatility 10(1s) Index
    Wait Until Page Contains Element    //*[@class='cq-menu-btn']    30
    Click Element    //*[@class='cq-symbol-select-btn']
    Wait Until Page Contains Element    //*[@class='sc-mcd__tabs__body']    30
    Wait Until Page Contains Element    //*[@class='sc-mcd__filter__item sc-mcd__filter__item--selected' and contains(.,'Synthetic Indices')]    30
    Click Element    //*[@class='sc-mcd__filter__item sc-mcd__filter__item--selected' and contains(.,'Synthetic Indices')]
    Wait Until Page Contains Element    //*[@class='sc-mcd__item sc-mcd__item--1HZ10V ']    30
    Click Element    //*[@class='sc-mcd__item__name' and contains(.,'Volatility 10 (1s) Index')]
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    //*[@class='cq-symbol-info' and contains(.,'Volatility 10 (1s) Index')]    30

Buy Contract
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    //*[@class='contract-type-widget__display' and contains(.,'Rise/Fall')]    30
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__toggle dc-button-menu__button dc-button-menu__button--active' and contains(.,'Ticks')]    30
    Wait Until Page Contains Element    //*[@id='dt_range_slider_label' and contains(.,'5 Ticks')]    30
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__toggle dc-button-menu__button dc-button-menu__button--active' and contains(.,'Stake')]    30
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value=10]    30
    Wait Until Page Contains Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Rise')]    30
    Click Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Rise')]


