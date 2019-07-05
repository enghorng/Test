*** Settings ***
Library           SeleniumLibrary
Resource          ../Variables/cw_system_landscape.robot

*** Variables ***
${OkButton}       id=_it_smc_liferay_privacy_web_portlet_PrivacyPortlet_okButton
${SignInToHomePageButton}    //*[contains(@value,'Sign in')]
${SingInToUsernamePwd}    //a[@href='https://uat-connect.crosswired.com/c/portal/login?p_l_id=2282185']
${Username}       enghorng@uat.crosswired.net
${UsernameInputText}    //label[text()='Username or email']//following::input[1]
${Password}       Welcome.01
${PasswordInputText}    //label[text()='Password']//following::input[1]

*** Keywords ***
Check Ok Button
    ${isOkButtonPresent}=    Run Keyword And Return Status    Element Should Be Visible    ${OkButton}
    Run Keyword If    ${isOkButtonPresent}    Click Button    ${OkButton}

Click Sing In to Home Page
    Click Button    ${SignInToHomePageButton}

Click Sign In to Username Pwd
    Click Link    ${SingInToUsernamePwd}

Input Username Password
    Wait Until Element Is Visible    ${UsernameInputText}    60
    Input Text    ${UsernameInputText}    ${Username}
    Input Password    ${PasswordInputText}    ${Password}

Open CW Url
    Open Browser    ${CWUrlDict['${TestSystem}']}    ${Broswer}
    Maximize Browser Window

Sing In to CW
    Open CW Url
    Check Ok Button
    Click Sign In to Username Pwd
    Input Username Password
    Click Sing In to Home Page
