*** Settings ***
Documentation     [ *Description:* Manage Catalog]
...               [ *Created by* Enghorng _#01-July-2019_ ]
...               [ *Reviewed by* God #30-June-2019 ]
Test Setup        Access To Team Site
Test Teardown
Library           SeleniumLibrary
Resource          Keywords/login.robot

*** Variables ***
${NewCatalogName}    Enghorng's Category
${OldCatalogName}    Enghorng
${DeleteDropdown}    //*[text()='${OldCatalogName}']//ancestor::div[4]//ul//li//a[contains(text(),'Delete')]
${CatalogCard}    //*[contains(text(),'${OldCatalogName}')]//ancestor::div[5]
${NewCategoryButton}    //div[@class='button-holder ']//button[@class='btn \ btn-primary btn-default']
${OkDeleteButton}    //*[contains(.,'OK' or 'Delete')]
${3dotsList}      //*[text()='${OldCatalogName}']//ancestor::div[4]//span[@class='icon-monospaced']/*[contains(@class,'lexicon-icon')]
${OrganizationCard}    //div[@class='cw-menu']//following::a[@href='https://uat-sk7.crosswired.com/catalog-admin']
${AdministrationTap}    //span[text()=' ADMINISTRATION ']//parent::a
${SettingDropdown}    //span[text()=' ADMINISTRATION ']//parent::a//parent::li//a[contains(@href,'settings')]
${SaveButton}     //*[contains(@class,'btn \ btn-primary btn-default')]
${CatalogPage}    //div[@class="card-horizontal main-content-card"]
${FindCatalog}    //*[contains(text(),'${OldCatalogName}')]
${HomePageLogo}    //a[@title='Home']

*** Test Cases ***
Create Catalog - Duplicate Name
    Click Create New Category
    Input Duplicate Name
    Click Save
    Verify Error Message - Duplicate Name

Create Catalog - Input Nothing
    Click Create New Category
    Wait Until Element Is Visible    //*[contains(text(),'All')]//following::div[1]//input    30
    Click Element    //*[contains(text(),'All')]//following::div[1]//input
    Click Save
    Verify Error Message - Not input required fill

Create Catalog - Verify User Input Require Fill
    Click Create New Category
    Input Require Fill
    Click Save
    Close Browser

Delete Catalog
    ${CheckCatalogName}=    Find Catalog Name
    Run Keyword If    ${CheckCatalogName}    F${Hound Catalog Name - Delete

Edit existing catalog
    ${CheckCatalogName}=    Find Catalog Name
    Run Keyword If    ${CheckCatalogName}    Found Catalog Name - Edit

Create, Delete, Edit
    Run Keyword And Ignore Error    TC Create Catalog - Verify User Input Require Fill
    Log    Create Catalog - Verify User wInput Rwawequire Fill
    Run Keyword And Ignore Error    Access To Team Site Again
    Run Keyword And Ignore Error    TC Create Catalog - Duplicate Name
    log    Create Catalog - Duplicate Name
    Run Keyword And Ignore Error    Access To Team Site Again
    Run Keyword And Ignore Error    TC Edit existing catalog
    log    Edit existing catalog
    Run Keyword And Ignore Error    Access To Team Site Again
    Run Keyword And Ignore Error    TC Delete Catalog
    log    Delete Catalog
    Run Keyword And Ignore Error    Back to Home Page

*** Keywords ***
Access To Team Site
    Sing In to CW
    Click on Organization Setting

Access To Team Site Again
    Back to Home Page
    Click on Organization Setting

Back to Home Page
    Click Element    ${HomePageLogo}

Choose Delete
    Click Element    ${DeleteDropdown}

Click Catalog Card
    Click Element    ${CatalogCard}

Click Create New Category
    Wait Until Element Is Visible    ${NewCategoryButton}    30
    Click Element    ${NewCategoryButton}

Click Detele or OK Button
    Handle Alert
    Run Keyword And Ignore Error    Click Element    ${OkDeleteButton}

Click on 3dots in any Category
    Wait Until Page Contains Element    ${3dotsList}
    Click Element    ${3dotsList}

Click on Organization Setting
    Wait Until Element Is Visible    ${OrganizationCard}    60
    Click Link    ${OrganizationCard}

Click on Setting on ADMINISTRATION tab
    Wait Until Element Is Visible    ${AdministrationTap}    30
    Click Element    ${AdministrationTap}
    Click Element    ${SettingDropdown}

Click Save
    Wait Until Element Is Visible    ${SaveButton}    30
    Click Element    ${SaveButton}

Find Catalog Name
    Wait Until Element Is Visible    ${CatalogPage}    30
    ${catalog}=    Run Keyword And Return Status    Element Should Be Visible    ${FindCatalog}
    [Return]    ${catalog}

Found Catalog Name - Delete
    Click on 3dots in any Category
    Choose Delete
    Click Detele or OK Button

Found Catalog Name - Edit
    Click Catalog Card
    Click on Setting on ADMINISTRATION tab
    Input Require Fill
    Click Save

Input Duplicate Name
    Wait Until Element Is Visible    //input[@id="_phaseSettingPortlet_categoryName"]    30
    Input Text    //input[@id="_phaseSettingPortlet_categoryName"]    ${OldCatalogName}

Input Require Fill
    Wait Until Element Is Visible    //input[@id="_phaseSettingPortlet_categoryName"]    30
    Input Text    //input[@id="_phaseSettingPortlet_categoryName"]    ${NewCatalogName}

Not Found Catalog Name
    Log    Not Found

Verify Error Message - Duplicate Name
    Wait Until Element Is Visible    //*[contains(text(),'Category name has to be unique')]    10
    Element Should Contain    //*[contains(text(),'Category name has to be unique')]    Category name has to be unique

Verify Error Message - Not input required fill
    Wait Until Element Is Visible    //*[contains(text(),'This field is required.')]    120
    Element Should Contain    //*[contains(text(),'This field is required.')]    This field is required.

TC Create Catalog - Duplicate Name
    Click Create New Category
    Input Duplicate Name
    Click Save
    Verify Error Message - Duplicate Name

TC Create Catalog - Input Nothing
    Click Create New Category
    Click Save
    Verify Error Message - Not input required fill

TC Create Catalog - Verify User Input Require Fill
    Click Create New Category
    Input Require Fill
    Click Save

TC Delete Catalog
    ${CheckCatalogName}=    Find Catalog Name
    Run Keyword If    ${CheckCatalogName}    Found Catalog Name - Delete

TC Edit existing catalog
    ${CheckCatalogName}=    Find Catalog Name
    Run Keyword If    ${CheckCatalogName}    Found Catalog Name - Edit
