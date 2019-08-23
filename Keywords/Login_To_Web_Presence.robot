*** Settings ***
Resource          Login_to_Crosswired.robot
Resource          ../Variables/cw_credential.robot

*** Variables ***
${SignIn}         Xpath=//span[contains(text(),'Sign In')]
${ButtonSignIn}    Xpath=//input[@id='kc-login']

*** Keywords ***
Sign In To WP
    [Arguments]    ${Role}=admin
    Open WP Url
    Click On Sign_In
    Input Username Password    ${Role}
    Click Sign In to Home Page

Open WP Url
    Open Browser    ${WPUrlDict['${TestSystem}']}    ${Broswer}
    Maximize Browser Window

Click On Sign_In
    Wait Until Element Is Visible    ${SignIn}
    Click Element    ${SignIn}
