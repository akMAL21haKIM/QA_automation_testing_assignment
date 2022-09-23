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

Change To AUD/USD
    Wait Until Page Contains Element    //*[@class='cq-menu-btn']    30
    Click Element    //*[@class='cq-symbol-select-btn']
    Wait Until Page Contains Element    //*[@class='sc-mcd__tabs__body']    30
    Wait Until Page Contains Element    //*[@class='sc-mcd__filter__item ' and contains(.,'Forex')]    30
    Click Element    //*[@class='sc-mcd__filter__item ' and contains(.,'Forex')]
    Wait Until Page Contains Element    //*[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ']    30
    Click Element    //*[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ' and contains(.,'AUD/USD')]
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    //*[@class='cq-symbol-info' and contains(.,'AUD/USD')]    30

Buy Lower Contract
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    //*[@class='contract-type-widget__display' and contains(.,'Rise/Fall')]    30
    Click Element    //*[@class='contract-type-widget__display']
    Wait Until Page Contains Element    //*[@class='dc-vertical-tab__header-title' and contains(.,'Trade types')]    30
    Click Element    //*[@class='dc-vertical-tab__header dc-vertical-tab__header--active' and contains(.,'All')]
    Wait Until Page Contains Element    //*[@class='contract-type-list' and contains(.,'Highs & Lows')]    30
    Click Element    //*[@id='dt_contract_high_low_item']
    Wait Until Page Contains Element    //*[@class='contract-type-widget__display' and contains(.,'Higher/Lower')]    30
    Wait Until Page Contains Element    //*[@id='dc_duration_toggle_item' and contains(.,'Duration')]    30
    Wait Until Page Contains Element    //*[@class='dc-dropdown-container dc-dropdown--left dc-dropdown--disabled' and contains(.,'Days')]    30
    Wait Until Page Contains Element    //*[@class='dc-input dc-datepicker__input dc-datepicker__input--has-leading-icon']    30
    Click Element    //*[@class='dc-input__field']
    Press Keys    none    BACKSPACE+4  
    Wait Until Page Contains Element    //*[@class='trade-container__fieldset trade-container__barriers']    30
    Wait Until Page Contains Element    //*[@class='trade-container__fieldset center-text']    30
    Wait Until Page Contains Element    //*[@id='dc_payout_toggle_item' and contains(.,'Payout')]    30
    Click Element    //*[@id='dc_payout_toggle_item' and contains(.,'Payout')]
    Click Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input']
    Press Keys    none    BACKSPACE+BACKSPACE+15.50
    Wait Until Page Contains Element    //*[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value=15.50]    30
    Wait Until Page Contains Element    //*[@class='trade-container__fieldset purchase-container__option']    30
    Wait Until Page Contains Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Lower')]    30
    Click Element    //*[@class='btn-purchase__shadow-wrapper' and contains(.,'Lower')]



