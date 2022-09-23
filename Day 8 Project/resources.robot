*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Create Token
    [Arguments]    ${whichToken}    ${scope}
    Wait Until Page Contains Element    //div[@class='dc-timeline__container']    30
    Wait Until Page Contains Element    //*[@class='dc-timeline__oval' and contains(.,'2')]    30
    Wait Until Page Contains Element    //*[@class='dc-input__field' and @aria-label='Token name']    30
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and @disabled]
    Click Element   //div[@class='composite-checkbox api-token__checkbox' and contains(.,'${scope}')]
    Wait Until Page Contains Element    //*[@class='dc-icon dc-icon--active']    30
    Click Element      //*[@class='dc-input__field' and @aria-label='Token name']
    Input Text    //input[@type='text']    ${whichToken}
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]    30
    Click Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]

Check Token
    [Arguments]    ${whichToken}    ${scope}
    Wait Until Page Contains Element    //div[@class='dc-timeline__container']    30
    Wait Until Page Contains Element    //*[@class='dc-timeline__oval' and contains(.,'3')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header-row']    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header' and contains(.,'Name')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header' and contains(.,'Token')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-header' and contains(.,'Scopes')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-cell-row' and contains(.,'${whichToken}')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-scope-cell' and contains(.,'${scope}')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-cell' and contains(.,'Never')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__pass-dot-container']    30
    Wait Until Page Contains Element    //*[@class='dc-icon da-api-token__visibility-icon']    30
    Click Element    //*[@class="da-api-token__table-cell-row" and contains(.,'${whichToken}')]//*[@class='dc-icon da-api-token__visibility-icon']
    Wait Until Page Contains Element    //*[@class='dc-text']    30
    Click Element    //*[@class="da-api-token__table-cell-row" and contains(.,'${whichToken}')]//*[@class='dc-icon da-api-token__visibility-icon']
    Wait Until Page Contains Element    //*[@class='dc-icon dc-clipboard']    30
    Click Element    //*[@class="da-api-token__table-cell-row" and contains(.,'${whichToken}')]//*[@class='dc-icon dc-clipboard']
    Wait Until Page Contains Element    //*[@class='dc-clipboard__popover dc-popover__bubble' and contains(.,'Token copied!')]    30

Delete Token
    [Arguments]    ${whichToken}    ${scope}
    Wait Until Page Contains Element    //*[@class='da-api-token__table']    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-cell-row' and contains(.,'${whichToken}')]    30
    Wait Until Page Contains Element    //*[@class='da-api-token__table-scope-cell' and contains(.,'${scope}')]    30
    Wait Until Page Contains Element    //*[@class='dc-icon dc-clipboard da-api-token__delete-icon']    30
    Click Element    //*[@class="da-api-token__table-cell-row" and contains(.,'${whichToken}')]//*[@class='dc-icon dc-clipboard da-api-token__delete-icon']
    Wait Until Page Contains Element    //*[@class='dc-modal__container dc-modal__container--small dc-modal__container--enter-done']    30
    Wait Until Page Contains Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'Yes, delete')]    30
    Click Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button' and contains(.,'Yes, delete')]
    Wait Until Page Does Not Contain    //*[@class='da-api-token__table-cell-row' and contains(.,'${whichToken}')]    30