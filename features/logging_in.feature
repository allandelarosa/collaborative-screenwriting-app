Feature: log in to existing account

  # had some trouble accessing accounts that are seeded, so needed to do this instead
  Background:
    Given I am on the signup page
    And I enter the Email "rp2496@columbia.edu"
    And I enter the Password "potato"
    And I enter the User Password Confirmation "potato"
    And I click "Create Account"
    And I Log Out
    Then I should be on the login page

  Scenario: log back in
    When I enter the Email "rp2496@columbia.edu"
    And I enter the Password "potato"
    And I click "Log In"
    Then I should be on the scripts page

  Scenario: prevent log in with wrong password
    When I enter the Email "rp2496@columbia.edu"
    And I enter the Password "not potato"
    And I click "Log In"
    Then I should be on the login page
