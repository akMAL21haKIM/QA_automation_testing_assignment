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

Change To Volatility 50 Index
    Wait Until Page Contains Element    //*[@class='cq-menu-btn']    30
    Click Element    //*[@class='cq-symbol-select-btn']
    Wait Until Page Contains Element    //*[@class='sc-mcd__tabs__body']    30
    Wait Until Page Contains Element    //*[@class='sc-mcd__filter__item sc-mcd__filter__item--selected' and contains(.,'Synthetic Indices')]    30
    Click Element    //*[@class='sc-mcd__filter__item sc-mcd__filter__item--selected' and contains(.,'Synthetic Indices')]
    Wait Until Page Contains Element    //*[@class='sc-mcd__item sc-mcd__item--R_50 ']    30
    Click Element    //*[@class='sc-mcd__item__name' and contains(.,'Volatility 50 Index')]
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    //*[@class='cq-symbol-info' and contains(.,'Volatility 50 Index')]    30

Set Multiplier Contract
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    //*[@class='contract-type-widget__display' and contains(.,'Rise/Fall')]    30
    Click Element    //*[@class='contract-type-widget__display']
    Wait Until Page Contains Element    //*[@class='dc-vertical-tab__header-title' and contains(.,'Trade types')]    30
    Click Element    //*[@class='dc-vertical-tab__header dc-vertical-tab__header--active' and contains(.,'All')]
    Wait Until Page Contains Element    //*[@class='contract-type-list' and contains(.,'Multipliers')]    30
    Click Element    //*[@id='dt_contract_multiplier_item']
    Wait Until Page Contains Element    //*[@class='contract-type-widget__display' and contains(.,'Multipliers')]    30
    Wait Until Page Contains Element    //*[@class='trade-container__fieldset center-text' and contains(.,'Stake')]    30

Test With 1 USD
    Click Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input']
    Press Keys    none    CTRL+a+BACKSPACE
    Press Keys    none    1
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value=1]    30
    Click Element    //*[@id='dt_amount_input_sub']
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value=0]    30
    Click Element    //*[@id='dt_amount_input_add']
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value=1]    30
    Click Element    //*[@class='dc-dropdown__display dc-dropdown__display--no-border']
    Wait Until Page Contains Element    //*[@class='dc-themed-scrollbars dc-themed-scrollbars__autohide']    30

Test With 2000 USD
    Click Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input']
    Press Keys    none    CTRL+a+BACKSPACE
    Press Keys    none    2000
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value=2000]    30
    Click Element    //*[@id='dt_amount_input_add']
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value=2001]    30
    Click Element    //*[@id='dt_amount_input_sub']
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value=2000]    30
    Click Element    //*[@class='dc-dropdown__display dc-dropdown__display--no-border']
    Wait Until Page Contains Element    //*[@class='dc-themed-scrollbars dc-themed-scrollbars__autohide']    30

Set Stake
    Click Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input']
    Press Keys    none    CTRL+a+BACKSPACE
    Press Keys    none    999
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value=999]    30

Buy Contract With Deal Cancellation
    Wait Until Page Contains Element    //*[@class='trade-container__fieldset' and contains(.,'Deal cancellation')]    30
    Click Element    //*[@class='trade-container__fieldset' and contains(.,'Deal cancellation')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Wait Until Page Contains Element    //*[@id='dropdown-display' and contains(.,'60 minutes')]    30
    Click Element    //*[@id='dropdown-display' and contains(.,'60 minutes')]
    Wait Until Page Contains Element    //*[@id='5m']    30
    Wait Until Page Contains Element    //*[@id='10m']    30
    Wait Until Page Contains Element    //*[@id='15m']    30
    Wait Until Page Contains Element    //*[@id='30m']    30
    Wait Until Page Contains Element    //*[@id='60m']    30
    Click Element    //*[@id='60m']
    Wait Until Page Contains Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Up')]    30
    Click Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Up')]
    Wait Until Page Contains Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Down')]    30
    Click Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Down')]
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper--inline' and contains(.,'Deal cancellation')]    30
    Click Element    //*[@class='dc-input-wrapper--inline' and contains(.,'Deal cancellation')]

Buy Contract With Take Profit
    Wait Until Page Contains Element    //*[@class='dc-checkbox take_profit-checkbox__input']    30
    Click Element    //*[@class='dc-checkbox take_profit-checkbox__input']
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element    //*[@id='dc_take_profit_input']
    Press Keys    none    CTRL+a+BACKSPACE
    Press Keys    none    90
    Wait Until Page Contains Element    //*[@id='dc_take_profit_input' and @value=90]    30
    Click Element    //*[@id='dc_take_profit_input_sub']
    Wait Until Page Contains Element    //*[@id='dc_take_profit_input' and @value=89]    30
    Click Element    //*[@id='dc_take_profit_input_add']
    Wait Until Page Contains Element    //*[@id='dc_take_profit_input' and @value=90]    30
    Click Element    //*[@id='dc_take_profit_input_add']
    Wait Until Page Contains Element    //*[@id='dc_take_profit_input' and @value=91]    30
    Click Element    //*[@id='dc_take_profit_input_sub']
    Wait Until Page Contains Element    //*[@id='dc_take_profit_input' and @value=90]    30
    Wait Until Page Contains Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Up')]    30
    Click Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Up')]
    Wait Until Page Contains Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Down')]    30
    Click Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Down')]
    Wait Until Page Contains Element    //*[@class='dc-checkbox take_profit-checkbox__input']    30
    Click Element    //*[@class='dc-checkbox take_profit-checkbox__input']

Buy Contract With Stop Loss
    Wait Until Page Contains Element    //*[@class='dc-checkbox stop_loss-checkbox__input']    30
    Click Element    //*[@class='dc-checkbox stop_loss-checkbox__input']
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element    //*[@id='dc_stop_loss_input']
    Press Keys    none    CTRL+a+BACKSPACE
    Press Keys    none    500
    Wait Until Page Contains Element    //*[@id='dc_stop_loss_input' and @value=500]    30
    Click Element    //*[@id='dc_stop_loss_input_sub']
    Wait Until Page Contains Element    //*[@id='dc_stop_loss_input' and @value=499]    30
    Click Element    //*[@id='dc_stop_loss_input_add']
    Wait Until Page Contains Element    //*[@id='dc_stop_loss_input' and @value=500]    30
    Click Element    //*[@id='dc_stop_loss_input_add']
    Wait Until Page Contains Element    //*[@id='dc_stop_loss_input' and @value=501]    30
    Click Element    //*[@id='dc_stop_loss_input_sub']
    Wait Until Page Contains Element    //*[@id='dc_stop_loss_input' and @value=500]    30
    Wait Until Page Contains Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Up')]    30
    Click Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Up')]
    Wait Until Page Contains Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Down')]    30
    Click Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Down')]
    Wait Until Page Contains Element    //*[@class='dc-checkbox stop_loss-checkbox__input']    30
    Click Element    //*[@class='dc-checkbox stop_loss-checkbox__input']