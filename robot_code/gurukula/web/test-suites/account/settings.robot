*** Settings ***
Documentation     Settings Tests Suite
Suite Teardown    Shutdown
Test Setup        I am on the gurukula website
Resource          ../../keywords/common.robot
Resource          ../../keywords/authentication.robot

*** Test Cases ***

Scenario: View and Edit Account Information
    [Documentation]                                    Create New Branch.
    Given I Login successfully as user
    And I access settings page
    And I view the account information
    When I edit the account information
    Then I check the account information was updated