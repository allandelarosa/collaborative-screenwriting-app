Feature: log in to existing account

  # had some trouble accessing accounts that are seeded, so needed to do this instead
  Background:
    Given I am on the signup page
    When I enter the Username "Ryan"
    And I enter the Email "rp2496"
    And I enter the Password "potato"
    And I enter the User Password Confirmation "potato"
    And I click "Sign up"
    And I click "Log Out"
    Then I should be on the login page

  Scenario: log back in
    When I enter the Email "rp2496"
    And I enter the Password "potato"
    And I click "Login"
    Then I should be on the scripts page

  Scenario: prevent log in with wrong password
    When I enter the Email "rp2496"
    And I enter the Password "not potato"
    And I click "Login"
    Then I should be on the login page
