*** Settings ***
Library    SeleniumLibrary
Resource    resources.robot

*** Variables ***
${email}    ...
${password}    ...
${read_token}    Read Token
${trade_token}    Trade Token
${payments_token}    Payments Token
${trading_information_token}    Trading information Token
${admin_token}    Admin Token
${all_scopes_token}    All Scopes Token

*** Test Cases ***
Login To Deriv
    Open Browser    https://app.deriv.com/account/api-token/    chrome 
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@id='oa_social_login_container']    30
    Wait Until Page Contains Element    //input[@type='email']    30
    Input Text    //input[@type='email']    ${email}
    Input Text    //input[@type='password']    ${password}  
    Click Element    //button[@type='submit']
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    dt_core_account-info_acc-info    30

Check The Checkboxes Containers
    Set Selenium Speed    0.5 seconds
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    //div[@class='dc-page-overlay__header-title' and contains(.,'Settings')]    30
    Wait Until Page Contains Element    //div[@class='dc-vertical-tab__tab dc-vertical-tab__tab--floating']    30
    Wait Until Page Contains Element    //*[@class='dc-vertical-tab__header dc-vertical-tab__header--floating dc-vertical-tab__header--active' and contains(.,'API token')]    30
    Click Element    //*[@class='dc-vertical-tab__header dc-vertical-tab__header--floating dc-vertical-tab__header--active' and contains(.,'API token')]
    Wait Until Page Contains Element    //div[@class='dc-timeline__container']    30
    Wait Until Page Contains Element    //*[@class='dc-timeline__oval' and contains(.,'1')]    30
    Wait Until Page Contains Element    //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Read')]    30
    Wait Until Page Contains Element    //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Trade')]    30
    Wait Until Page Contains Element    //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Payments')]    30
    Wait Until Page Contains Element    //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Trading information')]    30
    Wait Until Page Contains Element    //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Admin')]    30

Check The Checkboxes
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Read')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element   //div[@class='composite-checkbox api-token__checkbox composite-checkbox--active' and contains(.,'Read')]
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Trade')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element   //div[@class='composite-checkbox api-token__checkbox composite-checkbox--active' and contains(.,'Trade')]
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Payments')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element   //div[@class='composite-checkbox api-token__checkbox composite-checkbox--active' and contains(.,'Payments')]
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Trading information')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element   //div[@class='composite-checkbox api-token__checkbox composite-checkbox--active' and contains(.,'Trading information')]
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Admin')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element   //div[@class='composite-checkbox api-token__checkbox composite-checkbox--active' and contains(.,'Admin')]

Create Tokens
    Create Token    ${read_token}    Read
    Create Token    ${trade_token}    Trade
    Create Token    ${payments_token}    Payments
    Create Token    ${trading_information_token}    Trading information
    Create Token    ${admin_token}    Admin

Create All Scopes Token
    Wait Until Page Contains Element    //div[@class='dc-timeline__container']    30
    Wait Until Page Contains Element    //*[@class='dc-timeline__oval' and contains(.,'2')]    30
    Wait Until Page Contains Element    //*[@class='dc-input__field' and @aria-label='Token name']    30
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and @disabled]
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Read')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Trade')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Payments')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Trading information')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'Admin')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element      //*[@class='dc-input__field' and @aria-label='Token name']
    Input Text    //input[@type='text']    ${all_scopes_token}
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]    30
    Click Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]

Check Tokens
    Check Token    ${read_token}    Read
    Check Token    ${trade_token}    Trade
    Check Token    ${payments_token}    Payments
    Check Token    ${trading_information_token}    Trading information   

Check Admin Token
    Wait Until Page Contains Element    //div[@class='dc-timeline__container']    30
    Wait Until Page Contains Element    //*[@class='dc-timeline__oval' and contains(.,'3')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header-row']    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header' and contains(.,'Name')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header' and contains(.,'Token')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header' and contains(.,'Scopes')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-cell-row' and contains(.,'${admin_token}')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-scope-cell da-api-token__table-scope-cell-admin' and contains(.,'Admin')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-cell' and contains(.,'Never')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__pass-dot-container']    30
    Wait Until Page Contains Element    //*[@class='dc-icon da-api-token__visibility-icon']    30
    Click Element    //*[@class='dc-icon da-api-token__visibility-icon']
    Wait Until Page Contains Element    //*[@class='dc-text']    30
    Click Element    //*[@class='dc-icon da-api-token__visibility-icon']
    Wait Until Page Contains Element    //*[@class='dc-icon dc-clipboard']    30
    Click Element    //*[@class='dc-icon dc-clipboard']
    Wait Until Page Contains Element    //*[@class='dc-modal']    30
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'OK')]    30
    Click Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'OK')]
    Wait Until Page Contains Element    //*[@class='dc-clipboard__popover dc-popover__bubble' and contains(.,'Token copied!')]    30

Check All Scopes Token
    Wait Until Page Contains Element    //div[@class='dc-timeline__container']    30
    Wait Until Page Contains Element    //*[@class='dc-timeline__oval' and contains(.,'3')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header-row']    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header' and contains(.,'Name')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header' and contains(.,'Token')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header' and contains(.,'Scopes')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-cell-row' and contains(.,'${all_scopes_token}')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-cell' and contains(.,'Never')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__pass-dot-container']    30
    Wait Until Page Contains Element    //*[@class='dc-icon da-api-token__visibility-icon']    30
    Click Element    //*[@class="da-api-token__table-cell-row" and contains(.,'${all_scopes_token}')]//*[@class='dc-icon da-api-token__visibility-icon']
    Wait Until Page Contains Element    //*[@class='dc-text']    30
    Click Element    //*[@class="da-api-token__table-cell-row" and contains(.,'${all_scopes_token}')]//*[@class='dc-icon da-api-token__visibility-icon']
    Wait Until Page Contains Element    //*[@class='dc-icon dc-clipboard']    30
    Click Element    //*[@class="da-api-token__table-cell-row" and contains(.,'${all_scopes_token}')]//*[@class='dc-icon dc-clipboard']
    Wait Until Page Contains Element    //*[@class='dc-modal']    30
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'OK')]    30
    Click Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'OK')]
    Wait Until Page Contains Element    //*[@class='dc-clipboard__popover dc-popover__bubble' and contains(.,'Token copied!')]    30

Delete Tokens
    Delete Token    ${read_token}    Read
    Delete Token    ${trade_token}    Trade
    Delete Token    ${payments_token}    Payments
    Delete Token    ${trading_information_token}    Trading information

Delete Admin Token
    Wait Until Page Contains Element    //*[@class='da-api-token__table']    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-cell-row' and contains(.,'${admin_token}')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-scope-cell da-api-token__table-scope-cell-admin' and contains(.,'Admin')]    30
    Wait Until Page Contains Element    //*[@class='dc-icon dc-clipboard da-api-token__delete-icon']    30
    Click Element    //*[@class="da-api-token__table-cell-row" and contains(.,'${admin_token}')]//*[@class='dc-icon dc-clipboard da-api-token__delete-icon']
    Wait Until Page Contains Element    //*[@class='dc-modal__container dc-modal__container--small dc-modal__container--enter-done']    30
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'Yes, delete')]    30
    Click Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'Yes, delete')]
    Wait Until Page Does Not Contain    //*[@class='da-api-token__table-cell-row' and contains(.,'${admin_token}')]    30

Delete All Scopes Token
    Wait Until Page Contains Element    //*[@class='da-api-token__table']    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-cell-row' and contains(.,'${all_scopes_token}')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-scopes-cell-block' and contains(.,'Read') and contains(.,'Trade') and contains(.,'Payments') and contains(.,'Trading information')]//*[@class='da-api-token__table-scope-cell da-api-token__table-scope-cell-admin' and contains(.,'Admin')]    30
    Wait Until Page Contains Element    //*[@class='dc-icon dc-clipboard da-api-token__delete-icon']    30
    Click Element    //*[@class="da-api-token__table-cell-row" and contains(.,'${all_scopes_token}')]//*[@class='dc-icon dc-clipboard da-api-token__delete-icon']
    Wait Until Page Contains Element    //*[@class='dc-modal__container dc-modal__container--small dc-modal__container--enter-done']    30
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'Yes, delete')]    30
    Click Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'Yes, delete')]
    Wait Until Page Does Not Contain    //*[@class='da-api-token__table-cell-row' and contains(.,'${all_scopes_token}')]    30
    