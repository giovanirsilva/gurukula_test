*** Settings ***
Documentation     Branch Tests Suite
Suite Teardown    Shutdown
Test Teardown     Teardown Branch
Test Setup        I am on the gurukula website
Resource          ../../keywords/common.robot
Resource          ../../keywords/authentication.robot

*** Test Cases ***

Scenario: Create New Branch
    [Documentation]                                    Create New Branch.
    Given I Login successfully as user
    And I access branches page
    Sleep   1s
    When I create a new branch              ${NAME}     ${CODE}
    Sleep   2s
    Then I check the branch was created successfully       ${NAME}     ${CODE}


Scenario: View Branch
    [Documentation]                                    View Branch.
    Given I Login successfully as user
    And I access branches page
    When I create a new branch       BranchB     BRANCH02
    Then I view the branch         BranchB     BRANCH02


Scenario: Edit Branch
    [Documentation]                                    Edit Branch.
    Given I Login successfully as user
    And I access branches page
    When I create a new branch       ${NAME}             ${CODE}
    Then I edit the branch         ${NAME}     ${CODE}


Scenario: Query Branch
    [Documentation]                                    Query Branch.
    Given I Login successfully as user
    When I access branches page
    And I create a new branch       ${NAME}             ${CODE}
    And I create a new branch       BranchB             BRANCH02
    And I create a new branch       BranchC             BRANCH03
    Then I query the branch         BranchB     BRANCH02


