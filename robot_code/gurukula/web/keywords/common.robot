*** Settings ***

Library     Selenium2Library
Resource    ../variables/variables.robot


*** Keywords ***

I am on the gurukula website

    Open Browser                ${URL}    ${BROWSER}    None    ${SELENIUM}
    Maximize Browser Window

Shutdown
    Close Browser

Teardown
    Delete Staff
    Delete Branch
    Shutdown

Teardown Branch
    Delete Branch
    Shutdown

Delete Branch
    Wait Until Element is Visible       xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[4]/button[3]
    Click Element      xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[4]/button[3]
    Wait Until Element is Visible       xpath=//*[@id="deleteBranchConfirmation"]/div/div/form/div[3]/button[2]/span[2]
    Click Element      xpath=//*[@id="deleteBranchConfirmation"]/div/div/form/div[3]/button[2]/span[2]
    Sleep  1s

Delete Staff
    Wait Until Element is Visible       xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[4]/button[3]
    Click Element      xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[4]/button[3]
    Wait Until Element is Visible       xpath=//*[@id="deleteStaffConfirmation"]/div/div/form/div[3]/button[2]
    Click Element      xpath=//*[@id="deleteStaffConfirmation"]/div/div/form/div[3]/button[2]
    Sleep   2s
    Click Element                            xpath=//*[@id="navbar-collapse"]/ul/li[2]/a/span/span[2]
    Sleep   2s
    Click Element                            xpath=//*[@id="navbar-collapse"]/ul/li[2]/ul/li[1]/a/span[2]
    Sleep   2s

Page is loaded
    Wait Until Element Is Enabled             xpath=//ul[@class="opc-progress-bar"]
    Wait Until Element Is Not Visible         xpath=//div[@class="loader"]

I take a screenshot
    Capture Page Screenshot


I access branches page
    Sleep   2s
    Click Element                            xpath=//*[@id="navbar-collapse"]/ul/li[2]/a/span/span[2]
    Sleep   2s
    Click Element                            xpath=//*[@id="navbar-collapse"]/ul/li[2]/ul/li[1]/a/span[2]
    Sleep   2s

I create a new branch
    [Arguments]                     ${NAME2}             ${CODE2}
    Wait Until Element is Visible           xpath=/html/body/div[3]/div[1]/div/div[1]/div/div[1]/button/span[2]
    Sleep   2s
    Click Element                               xpath=/html/body/div[3]/div[1]/div/div[1]/div/div[1]/button/span[2]
    Sleep   2s
    I enter the branch name                              ${NAME2}
    Sleep   1s
    I enter the code name                                ${CODE2}
    Click Element                               xpath=//*[@id="saveBranchModal"]/div/div/form/div[3]/button[2]/span[2]

I enter the branch name
    [Arguments]                                        ${NAME}
    Wait Until Element Is Enabled                      xpath=//*[@id="saveBranchModal"]/div/div/form/div[2]/div[2]/input
    Input Text                                         xpath=//*[@id="saveBranchModal"]/div/div/form/div[2]/div[2]/input          ${NAME}


I enter the code name
    [Arguments]                                        ${CODE}
    Wait Until Element Is Enabled                      xpath=//*[@id="saveBranchModal"]/div/div/form/div[2]/div[3]/input
    Input Text                                         xpath=//*[@id="saveBranchModal"]/div/div/form/div[2]/div[3]/input           ${CODE}

I enter the staff name
    [Arguments]                                        ${STAFFNAME}
    Wait Until Element Is Enabled                      xpath=//*[@id="saveStaffModal"]/div/div/form/div[2]/div[2]/input
    Sleep   1s
    Input Text                                         xpath=//*[@id="saveStaffModal"]/div/div/form/div[2]/div[2]/input          ${STAFFNAME}

I choose a branch
    Click Element       xpath=//*[@id="saveStaffModal"]/div/div/form/div[2]/div[3]/select
    Sleep  2s
    Mouse Down      xpath=//*[@id="saveStaffModal"]/div/div/form/div[2]/div[3]/select/option[2]
    Click Element    xpath=//*[@id="saveStaffModal"]/div/div/form/div[2]/div[3]/select/option[2]


I check the branch was created successfully
    [Arguments]                     ${NAME}             ${CODE}
    Page Should Contain     ${NAME}      xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[2]
    Page Should Contain     ${CODE}     xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[3]


I check the staff was created successfully
    [Arguments]                     ${NAME}
    Sleep   2s
    Page Should Contain     ${NAME}      xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[2]

I view the branch
    [Arguments]                     ${NAME}             ${CODE}
    Wait Until Element Is Enabled          xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[4]/button[1]/span[2]
    Sleep   2s
    Click Element           xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[4]/button[1]/span[2]
    ${field_name}=   Get Value   xpath=/html/body/div[3]/div[1]/div/div/table/tbody/tr[1]/td[2]/input
    Should Be Equal     ${field_name}     BranchB
    ${field_code}=   Get Value    xpath=/html/body/div[3]/div[1]/div/div/table/tbody/tr[2]/td[2]/input
    Should Be Equal     ${field_code}     BRANCH02
    Sleep   2s
    Click Element           xpath=/html/body/div[3]/div[1]/div/button/span[2]


I edit the branch
    [Arguments]                     ${NAME}             ${CODE}
    Wait Until Element is Visible       xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[4]/button[2]/span[2]
    Sleep  2s
    Click Element           xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[4]/button[2]/span[2]
    Sleep   3s
    Press Keys      xpath=//*[@id="saveBranchModal"]/div/div/form/div[2]/div[2]/input     Editing
    Press Keys      xpath=//*[@id="saveBranchModal"]/div/div/form/div[2]/div[3]/input     05
    Click Element           xpath=//*[@id="saveBranchModal"]/div/div/form/div[3]/button[2]/span[2]
    Sleep   2s
    Page Should Contain     BranchAEditing      xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[2]
    Page Should Contain     BRANCH0105     xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr[1]/td[3]

I query the branch
    [Arguments]                     ${NAME}             ${CODE}

    Input Text            xpath=//*[@id="searchQuery"]         ${NAME}
    Sleep  2s
    Click Element         xpath=/html/body/div[3]/div[1]/div/div[1]/div/div[2]/form/button/span[2]
    Sleep  2s

    ${text}=   Get Text   xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[2]
    Should Be Equal     ${text}     ${NAME}

    Delete Branch
    Delete Branch



I query the staff
    [Arguments]                     ${STAFFNAME}        ${BRANCH}

    Input Text            xpath=//*[@id="searchQuery"]         ${STAFFNAME}
    Sleep  2s
    Click Element         xpath=/html/body/div[3]/div[1]/div/div[1]/div/div[2]/form/button/span[2]
    Sleep  2s

    ${text}=   Get Text   xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[2]
    Should Be Equal     ${text}     ${STAFFNAME}


     ${text2}=   Get Text   xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[3]
    Should Be Equal     ${text2}     ${BRANCH}

    Delete Staff
    Delete Staff


I access staff page
    Sleep   2s
    Click Element            xpath=//*[@id="navbar-collapse"]/ul/li[2]/a/span/span[2]
    Sleep   2s
    Click Element           xpath=//*[@id="navbar-collapse"]/ul/li[2]/ul/li[2]/a

I create a new staff
    [Arguments]         ${STAFFNAME}
    Sleep  2s
    Click Element       xpath=/html/body/div[3]/div[1]/div/div[1]/div/div[1]/button/span[2]
    I enter the staff name             ${STAFFNAME}
    Sleep   1s
    I choose a branch
    Click Element                               xpath=//*[@id="saveStaffModal"]/div/div/form/div[3]/button[2]/span[2]

I edit the staff
    Sleep   2s
    Click Element       xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[4]/button[2]/span[2]
    Sleep   2s
    Press Keys          xpath=//*[@id="saveStaffModal"]/div/div/form/div[2]/div[2]/input     Edited
    Click Element       xpath=//*[@id="saveStaffModal"]/div/div/form/div[3]/button[2]
    Sleep   2s
    Page Should Contain     StaffAEdited      xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[2]


I view the staff
    Sleep  2s
    Wait Until Element Is Enabled          xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[4]/button[1]
    Click Element           xpath=/html/body/div[3]/div[1]/div/div[4]/table/tbody/tr/td[4]/button[1]
    ${field_name}=   Get Value   xpath=/html/body/div[3]/div[1]/div/div/table/tbody/tr[1]/td[2]/input
    Should Be Equal     ${field_name}     StaffA
    Sleep   2s
    Click Element           xpath=/html/body/div[3]/div[1]/div/button


I access settings page
    Click Element       xpath=//*[@id="navbar-collapse"]/ul/li[3]/a
    Wait Until Element is Visible       xpath=//*[@id="navbar-collapse"]/ul/li[3]/ul/li[1]/a/span[2]
    Click Element       xpath=//*[@id="navbar-collapse"]/ul/li[3]/ul/li[1]/a/span[2]

I view the account information
    ${field_name}=      Get Value  xpath=/html/body/div[3]/div[1]/div/div/div/form/div[1]/input
    Should be equal  ${field_name}      Administrator

    ${field_name2}=      Get Value  xpath=/html/body/div[3]/div[1]/div/div/div/form/div[2]/input
    Should be equal  ${field_name2}      Administrator

    ${field_name3}=      Get Value  xpath=/html/body/div[3]/div[1]/div/div/div/form/div[3]/input
    Should be equal  ${field_name3}      admin@localhost

    ${field_name4}=      Get Value  xpath=/html/body/div[3]/div[1]/div/div/div/form/div[4]/select/option
    should contain  ${field_name4}      en

I edit the account information
    Sleep   2s
    Press Keys          xpath=/html/body/div[3]/div[1]/div/div/div/form/div[1]/input    Edited
    Press Keys          xpath=/html/body/div[3]/div[1]/div/div/div/form/div[2]/input    Edited
    Press Keys          xpath=/html/body/div[3]/div[1]/div/div/div/form/div[3]/input    Edited
    sleep  2s
    Click Element       xpath=/html/body/div[3]/div[1]/div/div/div/form/button




I check the account information was updated
    Click Element       xpath=//*[@id="navbar-collapse"]/ul/li[1]/a[2]/span[2]
    I access settings page
    ${field_name}=      Get Value  xpath=/html/body/div[3]/div[1]/div/div/div/form/div[1]/input
    Should be equal  ${field_name}      AdministratorEdited

    ${field_name2}=      Get Value  xpath=/html/body/div[3]/div[1]/div/div/div/form/div[2]/input
    Should be equal  ${field_name2}      AdministratorEdited

    ${field_name3}=      Get Value  xpath=/html/body/div[3]/div[1]/div/div/div/form/div[3]/input
    Should be equal  ${field_name3}      admin@localhostEdited

