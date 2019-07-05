*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Personal Profile
    Open Browser    https://uat-connect.crosswired.com/    chrome
    Maximize Browser Window
    Click Button    id=_it_smc_liferay_privacy_web_portlet_PrivacyPortlet_okButton
    Click Link    //div[contains(@class,'form-container')]//a[contains(text(),'Sign In')]
    Input Text    id=username    enghorng+2@uat.crosswired.net
    Input Password    id=password    Welcome.01
    Click Button    id=kc-login
    Sleep    5
    Capture Element Screenshot    //*[@id="heading"]/div[3]/div[3]/ul/li[8]
