*** Settings ***
Documentation     Staff Tests Suite
Suite Teardown    Shutdown
Test Teardown     Teardown
Test Setup        I am on the gurukula website
Resource          ../../keywords/common.robot
Resource          ../../keywords/authentication.robot

*** Test Cases ***

Scenario: Create New Staff
    [Documentation]                                    Create New Staff.
    Given I Login successfully as user
    And I access branches page
    And I create a new branch              ${NAME}     ${CODE}
    And I access staff page
    And I create a new staff        StaffA
    Then I check the staff was created successfully       StaffA


Scenario: Edit Staff
    [Documentation]                                    Edit Staff.
    Given I Login successfully as user
    And I access branches page
    And I create a new branch              ${NAME}     ${CODE}
    And I access staff page
    And I create a new staff        StaffA
    Then I edit the staff


Scenario: View Staff
    [Documentation]                                    View Staff.
    Given I Login successfully as user
    And I access branches page
    And I create a new branch              ${NAME}     ${CODE}
    And I access staff page
    And I create a new staff        StaffA
    Then I view the staff


Scenario: Query Staff
    [Documentation]                                    View Staff.
    Given I Login successfully as user
    And I access branches page
    And I create a new branch              ${NAME}     ${CODE}
    And I access staff page
    And I create a new staff        StaffA
    And I create a new staff        StaffB
    And I create a new staff        StaffC
    Then I query the staff          StaffB      BRANCH01