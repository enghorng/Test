*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Login to CW Chrome
    Open Browser    https://uat-connect.crosswired.com/    chrome
    Maximize Browser Window
    Click Button    id=_it_smc_liferay_privacy_web_portlet_PrivacyPortlet_okButton
    Click Link    //div[contains(@class,'form-container')]//a[contains(text(),'Sign In')]
    Input Text    id=username    enghorng+2@uat.crosswired.net
    Input Password    id=password    Welcome.01
    Click Button    id=kc-login

Input Text
    /html/body[@class='html-editor portlet cke_editable cke_editable_themed cke_contents_ltr cke_show_borders']    Catalog fot studying Automation Testing
    Comment

Firefox
    Open Browser    https://uat-connect.crosswired.com/    ie
    Maximize Browser Window
    ${isOkButtonPresent}=    Run Keyword And Return Status    Element Should Be Visible    id=_it_smc_liferay_privacy_web_portlet_PrivacyPortlet_okButton
    Run Keyword If    ${isOkButtonPresent}    Click Button    id=_it_smc_liferay_privacy_web_portlet_PrivacyPortlet_okButton
    Click Link    //a[@href='https://uat-connect.crosswired.com/c/portal/login?p_l_id=2282185']
    Input Text    //label[text()='Username or email']//following::input[1]    enghorng@uat.crosswired.net
    Input Password    //label[text()='Password']//following::input[1]    Welcome.01
    Click Button    //div[@class='form-group']//input[@value='Sign In']
    Click Link    //div[@class='cw-menu']//following::a[@href='https://uat-sk7.crosswired.com/catalog-admin']
    Click Element    //div[@class='button-holder ']//button[@class='btn \ btn-primary btn-default']
    Input Text    //label[@for='_phaseSettingPortlet_categoryName']//following::input[@id="_phaseSettingPortlet_categoryName"]    EH Study
