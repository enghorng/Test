*** Settings ***
Resource          Login_to_Crosswired.robot

*** Variables ***
${HomePageLogo}    //a[@title='Home']
${OrganizationCard}    //div[@class='cw-menu']//following::a[@href='${OrganizationUrl}/catalog-admin']
${OrganizationUrl}    https://uat-demo-cwex.crosswired.com

*** Keywords ***
Access To Team Site
    [Arguments]    ${Role}=orgAdmin
    Sign In to CW    ${Role}
    Click on Organization Setting

Access To Team Site Again
    Back to Home Page
    Click on Organization Setting

Back to Home Page
    Click Element    ${HomePageLogo}

Click on Organization Setting
    Wait Until Element Is Visible    ${OrganizationCard}    60
    Click Link    ${OrganizationCard}
