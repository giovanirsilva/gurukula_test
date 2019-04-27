*** Settings ***
Documentation     Authentication Tests Suite
Test Setup      I am on the gurukula website
Test Teardown    Shutdown
Suite Teardown   Shutdown
Resource          ../keywords/common.robot
Resource          ../keywords/authentication.robot

*** Test Cases ***
Scenario: Login successfully as user
    [Documentation]                                    Login successfuly as admin user.
    Given I am on the login page
    Sleep   1s
    When I login with my user credentials              ${LOGIN}     ${PASSWORD}
    Sleep   2s
    Then I am logged in as an admin user


Scenario: Login unsuccessfully as a wrong user
    [Documentation]                                    Login unsuccessfuly with a wrong user.
    Given I am on the login page
    Sleep   1s
    When I login with my user credentials              ${LOGIN_WRONG}     ${PASSWORD_WRONG}
    Sleep   2s
    Then I am not logged in


Scenario: Register a new user
    [Documentation]                                    Register a new user.
    Given I am on the login page
    Sleep   1s
    And I register a new account
    Sleep   2s
    Then The new account should be correct register


Scenario: Logout
    [Documentation]                                    Logout.
    Given I am on the login page
    Sleep   1s
    And I login with my user credentials              ${LOGIN}     ${PASSWORD}
    Sleep   2s
    When I am logged in as an admin user
    Then I logout



