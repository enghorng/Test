*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://uat-connect.crosswired.com/
${ch}             chrome
${card_value}     $7.00
${first_name}     EH
${last_name}      7
${email}          enghorng+10@uat.crosswired.net
${password}       Welcome.01
${dob}            09-08-1997
${street_name}    st109

*** Test Cases ***
Register
    GotoRegister
    Select From List By Value    //label[text()='Crosswired Subscription']//following::select[1]    ${card_value}
    Select From List By Value    //label[text()='Title']//following::select[1]    Ms.
    Input Text    //input[@autocomplete='given-name']    ${first_name}
    Input Text    //input[@autocomplete="family-name"]    ${last_name}
    Input Text    //input[@autocomplete="email"]    ${email}
    Input Text    //label[text()='Confirm Email']//following::input[1]    ${email}
    Input Password    //label[text()='Password']//following::input[1]    ${password}
    Input Password    //label[text()='Confirm password']//following::input[1]    ${password}
    Input Text    //input[@autocomplete="bday"]    ${dob}
    Click Button    xpath=//*[@id="kc-form-buttons"]/input
    Select From List By Value    //label[text()='Payment Method']//following::select[1]    card
    Input Text    //label[contains(text(),'Street Address')]//following::input[1]    ${street_name}
    Comment    Input Text    //label[contains(text(),'Suburb')]//following::input[1]    PP
    Comment    Input Text    //label[contains(text(),'Post Code')]//following::input[1]    24374
    Comment    Input Text    //label[contains(text(),'City')]//following::input[1]    PP
    Comment    Input Text    //label[contains(text(),'Country')]//following::input[1]    PP
    Comment    Input Text    //label[contains(text(),'Country')]//following::input[1]    Cambodia
    Test User Keyword    PP    24374    PP    PP    Cambodia
    Input Text    //label[contains(text(),'Telephone')]//following::input[1]    098765567
    Select Frame    //iframe[@name='__privateStripeFrame5']
    Input Text    //input[@autocomplete='cc-number']    4242424242424242
    Input Text    //input[@autocomplete="cc-exp"]    622
    Input Text    //input[@autocomplete="cc-csc"]    123
    Unselect Frame
    Click Button    //*[@id="kc-form-buttons"]/input

Register - Verify Dulpicate Email
    GotoRegister
    Select From List By Value    //label[text()='Crosswired Subscription']//following::select[1]    ${card_value}
    Select From List By Value    //label[text()='Title']//following::select[1]    Ms.
    Input Text    //input[@autocomplete='given-name']    ${first_name}
    Input Text    //input[@autocomplete="family-name"]    ${last_name}
    Input Text    //input[@autocomplete="email"]    ${email}
    Input Text    //label[text()='Confirm Email']//following::input[1]    ${email}
    Wait Until Element Is Visible    //*[@id="kc-register-form"]//div[@class='alert alert-error']    30
    Element Should Be Visible    //*[@id="kc-register-form"]//div[@class='alert alert-error']//span[@class='pficon pficon-error-circle-o']
    Element Should Contain    //*[@id="kc-register-form"]//div[@class='alert alert-error']//span[@class='kc-feedback-text']    Email already exists.

*** Keywords ***
Test User Keyword
    [Arguments]    ${p}    ${p1}    ${p2}    ${p3}    ${p4}
    Input Text    //label[contains(text(),'Suburb')]//following::input[1]    ${p}
    Input Text    //label[contains(text(),'Post Code')]//following::input[1]    ${p1}
    Input Text    //label[contains(text(),'City')]//following::input[1]    ${p2}
    Input Text    //label[contains(text(),'State')]//following::input[1]    ${p3}
    Input Text    //label[contains(text(),'Country')]//following::input[1]    ${p4}

GotoRegister
    Open Browser    ${url}    ${ch}
    Maximize Browser Window
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    //span[text()='OK']//parent::button[1]
    Run Keyword If    ${present}    Click Button    //span[text()='OK']//parent::button[1]
    Click Element    //div[contains(@class,'form-container')]//a[contains(text(),'Sign In')]
    Click Link    //div[contains(@class,'login-pf-signup')]//a[contains(text(),'Create account and subscribe')]
