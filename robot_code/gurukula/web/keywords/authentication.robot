*** Settings ***

Resource    ../keywords/common.robot
Resource    ../variables/authentication.robot

*** Keywords ***

I am on the login page
    Element Text Should Be                            xpath=/html/body/div[3]/div[1]/div/div/div[2]/h1      Welcome to Gurukula!

I login with my user credentials
    [Arguments]                                        ${user}                           ${password}
    Click Element                                      xpath=/html/body/div[3]/div[1]/div/div/div[2]/div/div[1]/a
    I enter my login                                   ${user}
    I enter my password                                ${password}
    I click on authenticate

I click on authenticate
    Click Element                                      css:button.btn.btn-primary.ng-scope

I enter my login
    [Arguments]                                        ${user}
    Wait Until Element Is Enabled                      id=username
    Input Text                                         id=username                 ${user}

I enter my password
    [Arguments]                                        ${password}
    Wait Until Element Is Enabled                      id=password
    Input Password                                     id=password                 ${password}

I am logged in as an admin user
    Wait until element Is Enabled       xpath=/html/body/div[3]/div[1]/div/div/div[2]/div
    ${text}=   Get Element Attribute   xpath=/html/body/div[3]/div[1]/div/div/div[2]/div      ng-switch
    Should Be Equal     ${text}     isAuthenticated()

I am not logged in
    ${text}=   Get Element Attribute   xpath=/html/body/div[3]/div[1]/div/div/div/div[1]      ng-show
    Should Be Equal     ${text}     authenticationError


I Login successfully as user
    I am on the login page
    I login with my user credentials              ${LOGIN}     ${PASSWORD}
    I am logged in as an admin user


I register a new account
    Click Element       xpath=/html/body/div[3]/div[1]/div/div/div[2]/div/div[2]/a

    Wait Until Element Is Enabled        xpath=/html/body/div[3]/div[1]/div/div/div/form/div[1]/input
    Input Text                           xpath=/html/body/div[3]/div[1]/div/div/div/form/div[1]/input           accountnew
    Input Text                           xpath=/html/body/div[3]/div[1]/div/div/div/form/div[2]/input           accountnew@gmail.com
    Input Text                           xpath=/html/body/div[3]/div[1]/div/div/div/form/div[3]/input           accountnewpassword1
    Input Text                           xpath=/html/body/div[3]/div[1]/div/div/div/form/div[4]/input           accountnewpassword1

    Click Element       xpath=/html/body/div[3]/div[1]/div/div/div/form/button



The new account should be correct register

    ${text}=   Get Element Attribute   xpath=/html/body/div[3]/div[1]/div/div/div/div[2]      ng-show
    Should Not Be Equal     ${text}     error


I logout
    Click Element     xpath=//*[@id="navbar-collapse"]/ul/li[3]/a/span/span[2]
    Click Element     xpath=//*[@id="navbar-collapse"]/ul/li[3]/ul/li[4]/a/span[2]

    Element Text Should Be                            xpath=/html/body/div[3]/div[1]/div/div/div[2]/h1      Welcome to Gurukula!
