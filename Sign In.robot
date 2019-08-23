*** Settings ***
Documentation     [*Description:*Dashboard]
...               [*Create by* Vireak_#31-july-2019_]
...               [*Reviewed by* sakor_#14-August-2019_]
...
...               [*To do before run test cast:]
...               [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
Library           SeleniumLibrary
Resource          Keywords/Login_to_Crosswired.robot
Resource          Variables/cw_system_landscape.robot
Resource          Variables/cw_credential.robot
Resource          Keywords/testuff_api.robot

*** Variables ***
${BacktoSignInButton}    //a[contains(text(),'Back to sign-in')]
${CreateAnAccountButton}    //a[contains(text(),'Create an account')]
${FeedBackText}    //*[contains(@id,'crosswired:feedback-text')]
${ForgetPasswordButton}    //a[contains(text(),'Forgot Password?') or @href='/auth/realms/uat/login-actions/reset-credentials?client_id=liferay.com&tab_id=Boe_KFD7dDo']
${InvalidUserName}    invalidemail@crosswired.net
${InvalidPassword}    InvalidPassword
${LogoCrosswired}    //img[contains(@alt,'Crosswired logo')]
${LoginScreenImage}    //img[contains(@id,'login_screen_image')]
${Pwd}            Welcome.01
${PasswordLabel}    //label[contains(text(),'Password')]
${RememberMeBox}    //*[contains(@id,'rememberMe')]
&{RoleDict}       1=visaCardUser    2=empEmVlPwd    3=ivlEmVlPwd    4=vlEmEmpPwd    5=vlEmIvlPwd    6=empEmEmpPwd
${ShowMessage}    Username or password is not correct. Please try again or use "Forgot Password" link to reset password.
${SignInLabel}    //h1[contains(text(),'Sign in')]
${UsernameOrEmailLabel}    //label[contains(text(),'Username or email')]
@{UISignInFilePath}    ${OUTPUT_DIR}/LogoCW.png    ${OUTPUT_DIR}/Image.png    ${OUTPUT_DIR}/HomePageBtn.png    ${OUTPUT_DIR}/CreateAccBtn.png
${URL}            http://uat-connect.crosswired.com/
${wait}           30

*** Test Cases ***
To Verify Sign In Functionality at login Screen
    [Documentation]    [*Description:*Dashboard]
    ...    [*Create by* Vireak_#31-july-2019_]
    ...    [*Reviewed by* sakor_#14-August-2019_]
    ...    [*Reviewed by* EngHorng_#22-August-2019_]
    ...
    ...    [*To do before run test cast:]
    ...    [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
    [Tags]    a
    Navigate To Login Screen CW
    Input Username Password    ${RoleDict['1']}
    Click Sign In to Home Page
    Comment    ${TestCaseID}    Set Variable    dopqrtwvzej5fkuz24guhvwjogruwsir
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Sign in process when User did not Enter Email, but Enter Password
    [Documentation]    [*Description:*Dashboard]
    ...    [*Create by* Vireak_#31-july-2019_]
    ...    [*Reviewed by* sakor_#14-August-2019_]
    ...    [*Reviewed by* EngHorng_#22-August-2019_]
    ...
    ...    [*To do before run test cast:]
    ...    [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
    [Tags]    b
    Navigate To Login Screen CW
    Input Username Password    ${RoleDict['2']}
    Click Sign In to Home Page
    Verify Message
    Comment    ${TestCaseID}    Set Variable    tpwwaa372oxso4ucqui5wmsczwauw5en
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Sign In process when User Enter invalid Email and valid Password
    [Documentation]    [*Description:*Dashboard]
    ...    [*Create by* Vireak_#31-july-2019_]
    ...    [*Reviewed by* sakor_#14-August-2019_]
    ...    [*Reviewed by* EngHorng_#22-August-2019_]
    ...
    ...    [*To do before run test cast:]
    ...    [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
    [Tags]    c
    Navigate To Login Screen CW
    Input Username Password    ${RoleDict['3']}
    Click Sign In to Home Page
    Verify Message
    Comment    ${TestCaseID}    Set Variable    ccxdi6g7b2d7t5ygkym7mesjv2uliq3z
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Sign In process when user Enter Valid Email and did not enter Password
    [Documentation]    [*Description:*Dashboard]
    ...    [*Create by* Vireak_#31-july-2019_]
    ...    [*Reviewed by* sakor_#14-August-2019_]
    ...    [*Reviewed by* EngHorng_#22-August-2019_]
    ...
    ...    [*To do before run test cast:]
    ...    [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
    [Tags]    d
    Navigate To Login Screen CW
    Input Username Password    ${RoleDict['4']}
    Click Sign In to Home Page
    Verify Message
    Comment    ${TestCaseID}    Set Variable    r3dwpyt6h32n4civcllwrdxzvatyxrzv
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Sign In Process when User Eneter Valid Email and enter Invalid Password
    [Documentation]    [*Description:*Dashboard]
    ...    [*Create by* Vireak_#31-july-2019_]
    ...    [*Reviewed by* sakor_#14-August-2019_]
    ...    [*Reviewed by* EngHorng_#22-August-2019_]
    ...
    ...    [*To do before run test cast:]
    ...    [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
    [Tags]    e
    Navigate To Login Screen CW
    Input Username Password    ${RoleDict['5']}
    Click Sign In to Home Page
    Verify Message
    Comment    ${TestCaseID}    Set Variable    bnommjdx6e66x6vgqu5zm3i7ydkmwkzj
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Sign In process when User did not Enter Email and Password
    [Documentation]    [*Description:*Dashboard]
    ...    [*Create by* Vireak_#31-july-2019_]
    ...    [*Reviewed by* sakor_#14-August-2019_]
    ...    [*Reviewed by* EngHorng_#22-August-2019_]
    ...
    ...    [*To do before run test cast:]
    ...    [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
    Navigate To Login Screen CW
    Input Username Password    ${RoleDict['6']}
    Click Sign In to Home Page
    Verify Message
    ${TestCaseID}    Set Variable    5fsmilqg6xciwdpkzfnuuan4mtr6iq2g
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Create an account button on Sign In Screen
    [Documentation]    [*Description:*Dashboard]
    ...    [*Create by* Vireak_#31-july-2019_]
    ...    [*Reviewed by* sakor_#14-August-2019_]
    ...    [*Reviewed by* EngHorng_#22-August-2019_]
    ...
    ...    [*To do before run test cast:]
    ...    [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
    Navigate To Login Screen CW
    Create An Account Button
    ${TestCaseID}    Set Variable    aywr4zcyepzkxyobl22t35lme3vo44fd
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Remember CheckBox
    [Documentation]    [*Description:*Dashboard]
    ...    [*Create by* Vireak_#31-july-2019_]
    ...    [*Reviewed by* sakor_#14-August-2019_]
    ...    [*Reviewed by* EngHorng_#22-August-2019_]
    ...
    ...    [*To do before run test cast:]
    ...    [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
    [Tags]    h
    Navigate To Login Screen CW
    Input Username Password    ${RoleDict['1']}
    Select Remember Me Box
    Click Sign In to Home Page
    ${TestCaseID}    Set Variable    abbwddhjetlhmurhtyr4dzfbj5oucygx
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Varify UI Sign In screen
    [Documentation]    [*Description:*Dashboard]
    ...    [*Create by* Vireak_#31-july-2019_]
    ...    [*Reviewed by* sakor_#14-August-2019_]
    ...    [*Reviewed by* EngHorng_#22-August-2019_]
    ...
    ...    [*To do before run test cast:]
    ...    [1:* Change user name and pwd in global keyword _ "Login_to_Crosswired_"]
    [Tags]    a
    Navigate To Login Screen CW
    Logo Crosswired & Image
    Verify label
    Verify Button Text
    ${TestCaseID}    Set Variable    cb7gfrt613weyhlj4vu0qid8o952zamn
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${EMPTY}    @{UISignInFilePath}

*** Keywords ***
Create An Account Button
    Wait Until Element Is Visible    ${CreateAnAccountButton}    30
    Click Link    ${CreateAnAccountButton}

Click Back To SignIn Button
    Wait Until Page Contains Element    ${BacktoSignInButton}    30
    Click Element    ${BacktoSignInButton}

Click Forget Password Button
    Click Element    ${ForgetPasswordButton}

Logo Crosswired & Image
    Wait Until Element Is Enabled    ${LogoCrosswired}    30
    Capture Element Screenshot    ${LogoCrosswired}    LogoCW.png
    Capture Element Screenshot    ${LoginScreenImage}    Image.png

Navigate To Login Screen CW
    Open CW Url
    Click Ok Button
    Click Sign In to Username Pwd

Select Remember Me Box
    Select Checkbox    ${RememberMeBox}

Verify Button Text
    Wait Until Page Contains Element    ${SignInToHomePageButton}
    Capture Element Screenshot    ${SignInToHomePageButton}    HomePageBtn.png
    Wait Until Page Contains Element    ${CreateAnAccountButton}
    Capture Element Screenshot    ${CreateAnAccountButton}    CreateAccBtn.png

Verify label
    Element Text Should Be    ${SignInLabel}    Sign in
    Element Text Should Be    ${UsernameOrEmailLabel}    Username or email
    Element Text Should Be    ${PasswordLabel}    Password

Verify Message
    Element Text Should Be    ${FeedBackText}    ${ShowMessage}
