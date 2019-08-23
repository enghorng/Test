*** Settings ***
Test Setup        Access to Register Page
Library           SeleniumLibrary
Library           String
Resource          Keywords/Login_to_Crosswired.robot
Resource          Variables/cw_system_landscape.robot
Resource          Keywords/testuff_api.robot

*** Variables ***
&{CouponNumberDict}    Monthly=UATMONTH01    Yearly=UATCOU20US    Both=CWCOUTEST1
&{PaymentInfoDataDict}    CardHolderName=AU    VisaCardNumber=4242424242424242    VisaCardCVC=123    Street=st173    Suburb=PP    PostalCode=12742    City=PP
...               State=PP    Country=Cambodia    Phone=098347974
&{PersonalInfoDataDict}    Mr=Mr.    Miss=Miss.    Mrs=Mrs.    FirstName=Test User    ExistingEmail=coupon@uat.crosswired.net
&{PersonalInfoLabelDict}    FirstName=First Name    LastName=Last Name    DOB=Date of Birth    Email=Email    ConfirmEmail=Confirm Email    Pwd=Password    ConfirmPwd=Confirm Password
&{PersonalInputTextXpartDict}    FirstName=//label[contains(text(),'First Name')]/parent::div/input    LastName=//label[contains(text(),'Last Name')]/parent::div/input    DOB=//label[contains(text(),'Date of Birth')]/parent::div/input    Email=//label[contains(text(),'Email')]/parent::div/input    ConfirmEmail=//label[contains(text(),'Confirm Email')]/parent::div/input    Pwd=//label[contains(text(),'Password')]/parent::div/input    ConfirmPwd=//label[contains(text(),'Confirm Password')]/parent::div/input
${BackSignInButton}    //span[contains(text(),'Back to Sign-in')]/ancestor::a
${CouponInputText}    //label[contains(text(),'Coupon')]/parent::div/input
${CreateAccountButton}    //*[contains(text(),'Create an account')]
${CWLogo}         //header/img[@src="https://uat-connect.crosswired.com/o/cw-cec-theme/images/crosswired-logo.png"]
${DateOfBirthUnder14YMessage}    //div[contains(text(),'You must be at least 14 years old.')]
${ExsitingEmailMessage}    //div[contains(text(),'The email address you requested is already taken.')]
${FeeMonthText}    //div/h4[contains(text(),'$15.00 / Month')]
${FinishText}     //div[contains(text(),'Finish')]
${InvalidCodePaymentMessage}    //*[contains(text(),'The code is invalid or no longer active')]
${MonthlySubcriberCard}    //input[contains(@value,'monthly')]/parent::div/parent::label/parent::div
${PaymentInfoText}    //div[contains(text(),'Payment Info')]
&{PaymentInputTextXpartDict}    CardHolderName=//label[contains(text(),'Cardholder’s Name')]/parent::div/input    VisaCardNumber=//input[@autocomplete='cc-number']    VisaCardExpire=//input[@autocomplete="cc-exp"]    VisaCardCVC=//input[@autocomplete="cc-csc"]    Street=//label[contains(text(),'Street Address')]/parent::div/input    Suburb=//label[contains(text(),'Suburb')]/parent::div/input    PostalCode=//label[contains(text(),'Postal Code')]/parent::div/input
...               City=//label[contains(text(),'City')]/parent::div/input    State=//label[contains(text(),'State / Province')]/parent::div/input    Country=//label[contains(text(),'Country')]/parent::div/input    Phone=//input[@placeholder='Enter Phone Number']
&{PersonalInfoLabelXpartDict}    Title=//label[contains(text(),'Title')]    FirstName=//label[contains(text(),'First Name')]    LastName=//label[contains(text(),'Last Name')]    DateOfBirth=//label[contains(text(),'Date of Birth')]    Email=//label[contains(text(),'Email')]    ConfirmEmail=//label[contains(text(),'Confirm Email')]    Pwd=//label[contains(text(),'Password')]
...               ConfirmPwd=//label[contains(text(),'Confirm Password')]
&{PersonalInfoPlaceholderXpartDict}    ConfirmEmail=//input[@placeholder='Confirm your email']    ConfirmPwd=//input[@placeholder='Confirm your password']    DateOfBirth=//input[@placeholder='mm/dd/yyyy']    Email=//input[@placeholder='Enter your email']    FirstName=//input[@placeholder='Enter your first name']    LastName=//input[@placeholder='Enter your last name']    Pwd=//input[@placeholder='Enter your password']
&{PersonalInfoTextXpartDict}    Miss=//option[contains(text(),'Miss.')]    Mr=//option[contains(text(),'Mr.')]    Mrs=//option[contains(text(),'Mrs.')]    NeedSomeInfo=//h3/span[contains(text(),'Need some information to get started')]    PersonalInfo=//div[contains(text(),'Personal')]    PwdRule=//p[contains(text(),'Every password')]
${ProceedToPaymentInfoButton}    //span[contains(text(),'Proceed to Payment Info')]//parent::button
&{PwdExampleXpartDict}    First=//li[contains(text(),'1John:3:16')]    Second=//li[contains(text(),'8*8=SixtyFour')]    Third=//li[contains(text(),'My.Number8')]
${RegisterPage}    //h1/span[contains(text(),'Register as a')]
${RegisterText}    //h1[@class='mb-5'][contains(text(),'Subscriber')]
${SignInPage}     //header/h1[contains(text(),'Sign in')]
${Subscribe}      //*[contains(text(),'Subscribe')]/parent::button
${SubscribeMonthText}    //div/h4[contains(text(),'$15')]/ancestor::label/h1[text()='Subscriber']
&{SubscriberBenifitXpartDict}    First=//li[contains(text(),'Increase')]    Second=//li[contains(text(),'Share a little')]    Third=//li[contains(text(),'Grow your network')]    Fourth=//li[contains(text(),'Chat')]    Fifth=//li[contains(text(),'Set goals')]    Sixth=//li[contains(text(),'Upgrade')]    Seventh=//li[contains(text(),'Share nuggets')]
${TitleDropdown}    //label[contains(text(),'Title')]/parent::div/select
${VisaCardBox}    //span[contains(text(),'Pay')]/ancestor::label/parent::div
${VisaCardNumberIframe}    //iframe[@name='__privateStripeFrame5']
${VisaCouponBox}    //span[text()='Apply a coupon code']/ancestor::label/parent::div
${YearlySubcriberCard}    //input[contains(@value,'yearly')]/parent::div/parent::label/parent::div

*** Test Cases ***
Access Login Screen
    [Documentation]    [ *Created by* Enghorng _#05-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    Comment    ${TestCaseID}    Set Variable    3ck2inuzzpni7sybjnhra7wdex3v5krj
    Page Should Contain Element    ${RegisterPage}
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Back to Sign-in Button
    [Documentation]    [ *Created by* Enghorng _#05-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    Comment    ${TestCaseID}    Set Variable    pzvkmrgqg7qe5lhbkagddrb2kbzbbr4c
    Click Back Sign In Link
    Page Should Contain Element    ${SignInPage}
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Create Account Screen
    [Documentation]    [ *Created by* Enghorng _#05-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    Comment    ${TestCaseID}    Set Variable    6l4jzhlcsezgy3wr4jgbmd2xkavbwriw
    Verify Crosswired Logo
    Verify Text on Screen
    Verify Button Text
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Require Field on Registration Screen
    [Documentation]    [ *Created by* Enghorng _#06-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    ${TestCaseID}    Set Variable    jl33ax46224l4v5qoo3s3rz5wubajz3c
    Click Element    ${ProceedToPaymentInfoButton}
    Verify Message - This Field is Required    ${PersonalInfoLabelDict['FirstName']}
    Verify Message - This Field is Required    ${PersonalInfoLabelDict['LastName']}
    Verify Message - This Field is Required    ${PersonalInfoLabelDict['DOB']}
    Verify Message - This Field is Required    ${PersonalInfoLabelDict['Email']}
    Verify Message - This Field is Required    ${PersonalInfoLabelDict['Pwd']}
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify that user cannot use Monthly Coupon for yearly Registration
    [Documentation]    [ *Created by* Enghorng _#06-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    ...
    ...    [ *Description: Last Name format* is _on MMDDYY_HHMMSS_. Ex: on 08062019_103013]
    ...    [ *Email format* is _testMMDDYY_HHMMSS@uat.crosswired.net_. Ex: test08062019_103013@uat.crosswired.net]
    ...    [ *Password format* is _Pwd.MMDDYY_. Ex: Pwd.08062019]
    ...
    ...    [ *Note: DateTime* on last name, email, and password are the same]
    ${TestCaseID}    Set Variable    hmlnbibus7wayfrc7ezujc7ddtttew33
    ${LastName}    Get Last Name
    ${DOB}    Get Date of Birth
    ${Email}    Get Email
    ${Pwd}    Get Password
    Fill Personal Info    ${PersonalInfoDataDict['Miss']}    ${PersonalInfoDataDict['FirstName']}    ${LastName}    ${DOB}    ${Email}    ${Email}
    ...    ${Pwd}    ${Pwd}
    Click Proceed to Payment Info Button
    Select Box Visa Coupon
    Enter Coupon Number    ${CouponNumberDict['Monthly']}
    Click Subscribe Button
    Verify Message - The code is invalid or no longer active
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify that user cannot use Yearly Coupon for Monthly Registration
    [Documentation]    [ *Created by* Enghorng _#07-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    ...
    ...    [ *Description: Last Name format* is _on MMDDYY_HHMMSS_. Ex: on 08062019_103013]
    ...    [ *Email format* is _testMMDDYY_HHMMSS@uat.crosswired.net_. Ex: test08062019_103013@uat.crosswired.net]
    ...    [ *Password format* is _Pwd.MMDDYY_. Ex: Pwd.08062019]
    ...
    ...    [ *Note: DateTime* on last name, email, and password are the same]
    ${TestCaseID}    Set Variable    ggrz3v3kny2itthhggyouwowxhbos6ps
    ${LastName}    Get Last Name
    ${DOB}    Get Date of Birth
    ${Email}    Get Email
    ${Pwd}    Get Password
    Fill Personal Info    ${PersonalInfoDataDict['Miss']}    ${PersonalInfoDataDict['FirstName']}    ${LastName}    ${DOB}    ${Email}    ${Email}
    ...    ${Pwd}    ${Pwd}
    Click Element    ${MonthlySubcriberCard}
    Click Proceed to Payment Info Button
    Select Box Visa Coupon
    Enter Coupon Number    ${CouponNumberDict['Yearly']}
    Click Subscribe Button
    Verify Message - The code is invalid or no longer active
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify User Cannot Register Account with Existing Email
    [Documentation]    [ *Created by* Enghorng _#07-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    ...
    ...    [ *Description: Last Name format* is _on MMDDYY_HHMMSS_. Ex: on 08062019_103013]
    ...    [ *Password format* is _Pwd.MMDDYY_. Ex: Pwd.08062019]
    ...
    ...    [ *Note: DateTime* on last name, and password are the same]
    ${TestCaseID}    Set Variable    lzusosdekghso2exn4acreos7im2eo5v
    ${LastName}    Get Last Name
    ${DOB}    Get Date of Birth
    ${Pwd}    Get Password
    Fill Personal Info    ${PersonalInfoDataDict['Miss']}    ${PersonalInfoDataDict['FirstName']}    ${LastName}    ${DOB}    ${PersonalInfoDataDict['ExistingEmail']}    ${PersonalInfoDataDict['ExistingEmail']}
    ...    ${Pwd}    ${Pwd}
    Verify Message - The email address you requested is already taken.
    Click Proceed to Payment Info Button
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Verify Date of Birth must be at least 14 years old.
    [Documentation]    [ *Created by* Enghorng _#09-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    ...
    ...    [ *Description: Last Name format* is _on MMDDYY_HHMMSS_. Ex: on 08062019_103013]
    ...    [ *Email format* is _testMMDDYY_HHMMSS@uat.crosswired.net_. Ex: test08062019_103013@uat.crosswired.net]
    ...    [ *Password format* is _Pwd.MMDDYY_. Ex: Pwd.08062019]
    ...
    ...    [ *Note: DateTime* on last name, email, and password are the same]
    ${TestCaseID}    Set Variable    wgdte7yx6u52rk226kk55phdl3x3bv6n
    ${LastName}    Get Last Name
    ${DOBUnder14Y}    Get Date of Birth Under 14y
    ${Email}    Get Email
    ${Pwd}    Get Password
    Fill Personal Info    ${PersonalInfoDataDict['Mr']}    ${PersonalInfoDataDict['FirstName']}    ${LastName}    ${DOBUnder14Y}    ${Email}    ${Email}
    ...    ${Pwd}    ${Pwd}
    Verify Message - You must be at least 14 years old.
    Click Proceed to Payment Info Button
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Registration Process with Credit Card
    [Documentation]    [ *Created by* Enghorng _#12-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    ...
    ...    [ *Description: Last Name format* is _on MMDDYY_HHMMSS_. Ex: on 08062019_103013]
    ...    [ *Email format* is _testMMDDYY_HHMMSS@uat.crosswired.net_. Ex: test08062019_103013@uat.crosswired.net]
    ...    [ *Password format* is _Pwd.MMDDYY_. Ex: Pwd.08062019]
    ...
    ...    [ *Note: DateTime* on last name, email, and password are the same]
    ${TestCaseID}    Set Variable    hyya4vj3bn46wmftswve4cxhtn3gpoeg
    ${LastName}    Get Last Name
    ${DOB}    Get Date of Birth
    ${Email}    Get Email
    ${Pwd}    Get Password
    Fill Personal Info    ${PersonalInfoDataDict['Miss']}    ${PersonalInfoDataDict['FirstName']}    ${LastName}    ${DOB}    ${Email}    ${Email}
    ...    ${Pwd}    ${Pwd}
    Click Element    ${MonthlySubcriberCard}
    Click Proceed to Payment Info Button
    Select Box Visa Card
    Fill VisaCard Info
    Comment    Click Subscribe Button
    Comment    Verify Successfully Register and Back to Login Screen
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Registration Process with 100% Discount Coupon Code
    [Documentation]    [ *Created by* Enghorng _#16-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    ...
    ...    [ *Description: Last Name format* is _on MMDDYY_HHMMSS_. Ex: on 08062019_103013]
    ...    [ *Email format* is _testMMDDYY_HHMMSS@uat.crosswired.net_. Ex: test08062019_103013@uat.crosswired.net]
    ...    [ *Password format* is _Pwd.MMDDYY_. Ex: Pwd.08062019]
    ...
    ...    [ *Note: DateTime* on last name, email, and password are the same]
    ${TestCaseID}    Set Variable    eblx4lzqegucweja453mkstx2xpxu22q
    ${LastName}    Get Last Name
    ${DOB}    Get Date of Birth
    ${Email}    Get Email
    ${Pwd}    Get Password
    Fill Personal Info    ${PersonalInfoDataDict['Miss']}    ${PersonalInfoDataDict['FirstName']}    ${LastName}    ${DOB}    ${Email}    ${Email}
    ...    ${Pwd}    ${Pwd}
    Click Element    ${MonthlySubcriberCard}
    Click Proceed to Payment Info Button
    Select Box Visa Coupon
    Enter Coupon Number    ${CouponNumberDict['Monthly']}
    Click Subscribe Button
    Verify Successfully Register and Back to Login Screen
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

Registration Process with some% Discount Coupon Code
    [Documentation]    [ *Created by* Enghorng _#16-Aug-2019_ ]
    ...    [ *Reviewed by* who #dd-MMM-yyyy ]
    ...
    ...    [ *Description: Last Name format* is _on MMDDYY_HHMMSS_. Ex: on 08062019_103013]
    ...    [ *Email format* is _testMMDDYY_HHMMSS@uat.crosswired.net_. Ex: test08062019_103013@uat.crosswired.net]
    ...    [ *Password format* is _Pwd.MMDDYY_. Ex: Pwd.08062019]
    ...
    ...    [ *Note: DateTime* on last name, email, and password are the same]
    ${TestCaseID}    Set Variable    m562gbq7hsqdzfrj3lmin7azrxk7gdba
    ${LastName}    Get Last Name
    ${DOB}    Get Date of Birth
    ${Email}    Get Email
    ${Pwd}    Get Password
    Fill Personal Info    ${PersonalInfoDataDict['Mrs']}    ${PersonalInfoDataDict['FirstName']}    ${LastName}    ${DOB}    ${Email}    ${Email}
    ...    ${Pwd}    ${Pwd}
    Click Proceed to Payment Info Button
    Select Box Visa Coupon
    Enter Coupon Number    ${CouponNumberDict['Yearly']}
    Click Subscribe Button
    Fill in Payment Information
    Click Subscribe Button
    Verify Successfully Register and Back to Login Screen
    [Teardown]    Report To Testuff​ on TearDown    ${TestCaseID}    ${TEST_STATUS}

*** Keywords ***
Access to Register Page
    Open CW Url
    Click Ok Button
    Click Sign In to Username Pwd
    Click Create as account Button

Click Create as account Button
    Click Element    ${CreateAccountButton}

Click Back Sign In Link
    Click Element    ${BackSignInButton}

Click Proceed to Payment Info Button
    Click Element    ${ProceedToPaymentInfoButton}

Click Subscribe Button
    Click Element    ${Subscribe}

Enter Coupon Number
    [Arguments]    ${CouponNumber}
    Input Text    ${CouponInputText}    ${CouponNumber}

Fill in Payment Information
    Input Text    ${PaymentInputTextXpartDict['Street']}    ${PaymentInfoDataDict['Street']}
    Input Text    ${PaymentInputTextXpartDict['Suburb']}    ${PaymentInfoDataDict['Suburb']}
    Input Text    ${PaymentInputTextXpartDict['PostalCode']}    ${PaymentInfoDataDict['PostalCode']}
    Input Text    ${PaymentInputTextXpartDict['City']}    ${PaymentInfoDataDict['City']}
    Input Text    ${PaymentInputTextXpartDict['State']}    ${PaymentInfoDataDict['State']}
    Input Text    ${PaymentInputTextXpartDict['Country']}    ${PaymentInfoDataDict['Country']}
    Input Text    ${PaymentInputTextXpartDict['Phone']}    ${PaymentInfoDataDict['Phone']}

Fill Personal Info
    [Arguments]    ${TitleValue}=Mr.    ${FirstName}=${EMPTY}    ${LastName}=${EMPTY}    ${DOB}=${EMPTY}    ${Email}=${EMPTY}    ${ConEmail}=${EMPTY}
    ...    ${Pwd}=${EMPTY}    ${ConPwd}=${EMPTY}
    ${TitleOption}    Set Variable    //label[contains(text(),'Title')]/parent::div/select/option[@value='${TitleValue}']
    Click Element    ${YearlySubcriberCard}
    Click Element    ${TitleDropdown}
    Click Element    ${TitleOption}
    Input Text    ${PersonalInputTextXpartDict['FirstName']}    ${FirstName}
    Input Text    ${PersonalInputTextXpartDict['LastName']}    ${LastName}
    Input Text    ${PersonalInputTextXpartDict['DOB']}    ${DOB}
    Input Text    ${PersonalInputTextXpartDict['Email']}    ${Email}
    Input Text    ${PersonalInputTextXpartDict['ConfirmEmail']}    ${ConEmail}
    Input Text    ${PersonalInputTextXpartDict['ConfirmEmail']}    ${ConEmail}
    Input Text    ${PersonalInputTextXpartDict['Pwd']}    ${Pwd}
    Input Text    ${PersonalInputTextXpartDict['ConfirmPwd']}    ${ConPwd}

Fill VisaCard Info
    ${VisaCardExpire}    Get Visa Card Expire Date
    Input Text    ${PaymentInputTextXpartDict['CardHolderName']}    ${PaymentInfoDataDict['CardHolderName']}
    Select Frame    ${VisaCardNumberIframe}
    Sleep    2
    Input Text    ${PaymentInputTextXpartDict['VisaCardNumber']}    ${PaymentInfoDataDict['VisaCardNumber']}
    ${check}    Run Keyword And Return Status    Element Should Be Visible    //input[@value='4242 4242 4242 4242']
    Run Keyword If    ${check}    True Condition
    ...    ELSE    Input Visa Card Number Again
    Input Text    ${PaymentInputTextXpartDict['VisaCardExpire']}    ${VisaCardExpire}
    Input Text    ${PaymentInputTextXpartDict['VisaCardCVC']}    ${PaymentInfoDataDict['VisaCardCVC']}
    Unselect Frame
    Fill in Payment Information

Get Date of Birth
    ${DOB}    Get Substring of Current Date
    ${DOB}    Get Substring    ${DOB}    \    8
    ${Month}=    Get Substring    ${DOB}    \    2
    ${Day}=    Get Substring    ${DOB}    2    4
    ${Year}=    Get Substring    ${DOB}    4    8
    ${Year}    Evaluate    ${Year}-18
    ${DOB}    Set Variable    ${Month}${Day}${Year}
    [Return]    ${DOB}

Get Date of Birth Under 14y
    ${DOBUnder14Y}    Get Substring of Current Date
    ${DOBUnder14Y}    Get Substring    ${DOBUnder14Y}    \    8
    ${Month}=    Get Substring    ${DOBUnder14Y}    \    2
    ${Day}=    Get Substring    ${DOBUnder14Y}    2    4
    ${Year}=    Get Substring    ${DOBUnder14Y}    4    8
    ${Year}    Evaluate    ${Year}-13
    ${DOBUnder14Y}    Set Variable    ${Month}${Day}${Year}
    [Return]    ${DOBUnder14Y}

Get Email
    ${Last}=    Get Substring of Current Date
    ${Em}=    Set Variable    test${Last}@uat.crosswired.net
    [Return]    ${Em}

Get Last Name
    ${Last}=    Get Substring of Current Date
    ${Last}=    Set Variable    on ${Last}
    [Return]    ${Last}

Get Substring of Current Date
    ${CurDate}=    Get Current Date
    ${Year}=    Get Substring    ${CurDate}    \    4
    ${Month}=    Get Substring    ${CurDate}    5    7
    ${Day}=    Get Substring    ${CurDate}    8    10
    ${H}=    Get Substring    ${CurDate}    11    13
    ${M}=    Get Substring    ${CurDate}    14    16
    ${S}=    Get Substring    ${CurDate}    17    19
    ${CurDate}=    Set Variable    ${Month}${Day}${Year}_${H}${M}${S}
    [Return]    ${CurDate}

Get Password
    ${Pwd}    Get Substring of Current Date
    ${Pwd}    Get Substring    ${Pwd}    \    8
    ${Pwd}    Set Variable    Pwd.${Pwd}
    [Return]    ${Pwd}

Get Visa Card Expire Date
    ${Exp}    Get Substring of Current Date
    ${Month}=    Get Substring    ${Exp}    \    2
    ${Year}=    Get Substring    ${Exp}    4    6
    ${Year}    Evaluate    ${Year}+4
    ${Exp}    Set Variable    ${Month}${Year}
    [Return]    ${Exp}

Input Visa Card Number Again
    Input Text    ${PaymentInputTextXpartDict['VisaCardNumber']}    ${PaymentInfoDataDict['VisaCardNumber']}

Select Box Visa Card
    Wait Until Element Is Visible    ${VisaCardBox}    30
    Click Element    ${VisaCardBox}

Select Box Visa Coupon
    Wait Until Element Is Visible    ${VisaCouponBox}    30
    Click Element    ${VisaCouponBox}

True Condition
    log    True

Verify Button Text
    Page Should Contain Element    ${BackSignInButton}
    Page Should Contain Element    ${ProceedToPaymentInfoButton}

Verify Crosswired Logo
    Page Should Contain Image    ${CWLogo}

Verify Message - The code is invalid or no longer active
    Wait Until Element Is Visible    ${InvalidCodePaymentMessage}    30
    Element Should Contain    ${InvalidCodePaymentMessage}    The code is invalid or no longer active

Verify Message - The email address you requested is already taken.
    Wait Until Element Is Visible    ${ExsitingEmailMessage}    30
    Element Should Contain    ${ExsitingEmailMessage}    The email address you requested is already taken.

Verify Message - This Field is Required
    [Arguments]    ${Info}
    ${RequiredFill}    Set Variable    //label[contains(text(),'${Info}')]//parent::div//div//div[contains(text(),'This field is required.')]
    Element Should Contain    ${RequiredFill}    This field is required.

Verify Message - You must be at least 14 years old.
    Wait Until Element Is Visible    ${DateOfBirthUnder14YMessage}    30
    Element Should Contain    ${DateOfBirthUnder14YMessage}    You must be at least 14 years old.

Verify Successfully Register and Back to Login Screen
    Wait Until Element Contains    ${SignInPage}    Sign in

Verify Text on Screen
    Page Should Contain Element    ${RegisterText}
    Page Should Contain Element    ${PersonalInfoTextXpartDict['PersonalInfo']}
    Page Should Contain Element    ${PaymentInfoText}
    Page Should Contain Element    ${FinishText}
    Page Should Contain Element    ${FeeMonthText}
    Page Should Contain Element    ${SubscribeMonthText}
    Element Should Contain    ${SubscriberBenifitXpartDict['First']}    Increase your knowledge and skills with ONLINE TRAINING for missions
    Element Should Contain    ${SubscriberBenifitXpartDict['Second']}    Share a little, a lot or nothing at all on your PERSONAL PROFILE
    Element Should Contain    ${SubscriberBenifitXpartDict['Third']}    Grow your network with ENHANCED DIRECTORY and advanced security options
    Element Should Contain    ${SubscriberBenifitXpartDict['Fourth']}    Chat securely with your contacts via PRIVATE MESSAGING
    Element Should Contain    ${SubscriberBenifitXpartDict['Fifth']}    Set goals and participate in discipleship with COACHING & MENTORING
    Element Should Contain    ${SubscriberBenifitXpartDict['Sixth']}    Upgrade to WEB PRESENCE to share your stories and encourage your supporters
    Element Should Contain    ${SubscriberBenifitXpartDict['Seventh']}    Share nuggets of wisdom from our MICRO-LEARNING CATALOG with your supporters
    Page Should Contain Element    ${PersonalInfoTextXpartDict['NeedSomeInfo']}
    Page Should Contain Element    ${PersonalInfoLabelXpartDict['Title']}
    Page Should Contain Element    ${PersonalInfoTextXpartDict['Mr']}
    Page Should Contain Element    ${PersonalInfoTextXpartDict['Mrs']}
    Page Should Contain Element    ${PersonalInfoTextXpartDict['Miss']}
    Page Should Contain Element    ${PersonalInfoLabelXpartDict['FirstName']}
    Page Should Contain Element    ${PersonalInfoLabelXpartDict['LastName']}
    Page Should Contain Element    ${PersonalInfoLabelXpartDict['DateOfBirth']}
    Page Should Contain Element    ${PersonalInfoLabelXpartDict['Email']}
    Page Should Contain Element    ${PersonalInfoLabelXpartDict['ConfirmEmail']}
    Page Should Contain Element    ${PersonalInfoLabelXpartDict['Pwd']}
    Page Should Contain Element    ${PersonalInfoLabelXpartDict['ConfirmPwd']}
    Page Should Contain Element    ${PersonalInfoPlaceholderXpartDict['FirstName']}
    Page Should Contain Element    ${PersonalInfoPlaceholderXpartDict['LastName']}
    Page Should Contain Element    ${PersonalInfoPlaceholderXpartDict['DateOfBirth']}
    Page Should Contain Element    ${PersonalInfoPlaceholderXpartDict['Email']}
    Page Should Contain Element    ${PersonalInfoPlaceholderXpartDict['ConfirmEmail']}
    Page Should Contain Element    ${PersonalInfoPlaceholderXpartDict['Pwd']}
    Page Should Contain Element    ${PersonalInfoPlaceholderXpartDict['ConfirmPwd']}
    Element Text Should Be    ${PersonalInfoTextXpartDict['PwdRule']}    Every password must be at least 8 characters long. Also, it must have at least one upper case letter, one lower case letter, and one number. Here are some examples:
    Page Should Contain Element    ${PwdExampleXpartDict['First']}
    Page Should Contain Element    ${PwdExampleXpartDict['Second']}
    Page Should Contain Element    ${PwdExampleXpartDict['Third']}
