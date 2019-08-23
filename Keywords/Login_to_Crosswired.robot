*** Settings ***
Library           SeleniumLibrary
Resource          ../Variables/cw_credential.robot
Resource          ../Variables/cw_system_landscape.robot

*** Variables ***
${OkButton}       id=_it_smc_liferay_privacy_web_portlet_PrivacyPortlet_okButton
${SignInToHomePageButton}    //*[contains(@value,'Sign in')]
${SignInToUsernamePwd}    //a[@href='https://uat-connect.crosswired.com/c/portal/login?p_l_id=2282185']
${UsernameInputText}    //label[text()='Username or email']//following::input[1]
${PasswordInputText}    //label[text()='Password']//following::input[1]

*** Keywords ***
Click Ok Button
    ${isOkButtonPresent}=    Run Keyword And Return Status    Element Should Be Visible    ${OkButton}
    Run Keyword If    ${isOkButtonPresent}    Click Button    ${OkButton}

Click Sign In to Home Page
    Wait Until Element Is Visible    ${SignInToHomePageButton}    30
    Click Button    ${SignInToHomePageButton}

Click Sign In to Username Pwd
    Click Link    ${SignInToUsernamePwd}

Input Username Password
    [Arguments]    ${Role}
    Wait Until Page Contains Element    ${UsernameInputText}    30
    Input Text    ${UsernameInputText}    ${UsernameDict['${Role}']}
    Input Text    ${PasswordInputText}    ${PasswordDict['${Role}']}

Open CW Url
    Open Browser    ${CWUrlDict['${TestSystem}']}    ${Broswer}
    Maximize Browser Window

Sign In to CW
    [Arguments]    ${Role}=admin
    Open CW Url
    Click Ok Button
    Click Sign In to Username Pwd
    Input Username Password    ${Role}
    Click Sign In to Home Page
