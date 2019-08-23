*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library           Collections
Library           RequestsLibrary
Variables         ../CustomLibrary/Testuff_API.py
Library           DateTime

*** Variables ***
${ApiUrl}         https://service8.testuff.com/api/v0
${Optional}       ${EMPTY}
${TestuffUsername}    kongheng.long@khalibre.com
${TestuffPassword}    sAXtRgGf

*** Keywords ***
Report To Testuff​ on TearDown
    [Arguments]    ${testId}    ${testStatus}    @{filePath}
    ${status}=    Set Variable If    '${testStatus}'=='PASS'    passed    failed
    : FOR    ${i}    IN    @{filePath}
    \    Exit For Loop If    '${testStatus}'=='FAIL'
    \    ${status}    Set Variable    ${EMPTY}
    \    Exit For Loop
    ${RobotLab}=    Get Lab Name
    Run Keyword And Ignore Error    Request Run Testcase to Testuff    ${testId}    ${RobotLab}    ${status}    @{filePath}
    Close Browser

Get AuthToken
    ${accessToken}=    Convert To Bytes    ${TestuffUsername}:${TestuffPassword}
    ${accessToken}=    Evaluate    base64.b64encode($accessToken)    base64
    ${headers}    Create Dictionary
    Set To Dictionary    ${headers}    Authorization    Basic ${accessToken}
    Set To Dictionary    ${headers}    Content-Type    application/json
    Set To Dictionary    ${headers}    Accept    application/json
    [Return]    ${headers}

Request Run Testcase to Testuff
    [Arguments]    ${testId}    ${Robotlab}    ${status}    @{filePath}
    ${testResult}=    Create Test Results    ${testId}    ${status}    ${Robotlab}
    ${headers}    Get AuthToken
    ${auth_token}=    Set Variable    ${headers["Authorization"]}
    Log    ${auth_token}
    Create Session    apiSession    ${ApiUrl}
    ${response}=    Post Request    apiSession    /run/    data=${testResult}    headers=${headers}
    Log    ${response}
    Log    ${response.content}
    ${id}=    Execute Javascript    var data = ${response.content}; return data['id'];
    Run Keyword And Ignore Error    Upload Any File To Testuff    ${id}    ${auth_token}    ${ApiUrl}    @{filePath}

Create Test Results
    [Arguments]    ${testId}    ${status}    ${labName}    ${branchName}=${Optional}    ${comment}=${Optional}    ${stepsFailed}=${Optional}
    ...    ${stepsPassed}=${Optional}    ${runConfig}=${Optional}    ${version}=${Optional}
    ${testResults}=    Create Dictionary
    Set To Dictionary    ${testResults}    test_id    ${testId}
    Set To Dictionary    ${testResults}    status    ${status}
    Set To Dictionary    ${testResults}    lab_name    ${labName}
    Set To Dictionary    ${testResults}    steps_failed    ${stepsFailed}
    Set To Dictionary    ${testResults}    steps_passed    ${stepsPassed}
    Set To Dictionary    ${testResults}    branch_name    ${branchName}
    Set To Dictionary    ${testResults}    run_configuration    ${runConfig}
    Set To Dictionary    ${testResults}    comment    ${comment}
    Set To Dictionary    ${testResults}    version    ${version}
    [Return]    ${testResults}

Request Upload File To Testuff
    [Arguments]    ${runId}    ${token}
    Comment    : FOR    ${INDEX}    IN RANGE    1    4
    Comment    \    Run Keyword If    '${INDEX}'=='1'    Call Method    ${obj}    post_file
    ...    ${runId}    ${token}    ${LOG_FILE}
    Comment    \    Run Keyword If    '${INDEX}'=='2'    Call Method    ${obj}    post_file
    ...    ${runId}    ${token}    ${OUTPUT_FILE}
    Comment    \    Run Keyword If    '${INDEX}'=='3'    Call Method    ${obj}    post_file
    ...    ${runId}    ${token}    ${REPORT_FILE}
    Call Method    ${obj}    post_file    ${runId}    ${token}    ${LOG_FILE}

Get ScreenShot File When Error Appear
    [Arguments]    ${runId}    ${token}
    @{files}=    List Files In Directory    ${OUTPUT_DIR}    *.png*
    ${last}=    Get From List    ${files}    -1
    Log    ${last}
    ${img_path}=    Catenate    SEPARATOR=    ${OUTPUT_DIR}    \\    ${last}
    Log    ${img_path}
    ${a}=    Call Method    ${obj}    post_file    ${runId}    ${token}    ${img_path}
    Log    ${a}

Upload Any File To Testuff
    [Arguments]    ${runId}    ${token}    ${Url}    @{filePath}
    : FOR    ${path}    IN    @{filePath}
    \    Call Method    ${obj}    post_file    ${runId}    ${token}    ${Url}
    \    ...    ${path}

Get Lab Name
    ${LabName}=    Get Current Date
    ${LabName}=    Get Substring    ${LabName}    \    10
    ${LabName1}=    Catenate    CW AU On    ${LabName}
    [Return]    ${LabName1}
