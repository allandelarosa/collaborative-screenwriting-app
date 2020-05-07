Feature: create a new user

  Background:
    Given the following users exist:
      | username | email                | password_digest |
      | Allan    | ajd2215@columbia.edu | asdf            |
    Then 1 seed user should exist
    Given I am on the signup page

  Scenario: prevent user creation for invalid email
    When I enter the Password "potato"
    # needed to add 'User' because a problem with finding a name with spaces in it
    And I enter the User Password Confirmation "potato"
    When I enter the Email "invalidemail"
    And I click "Create Account"
    Then I should be on the signup page

  Scenario: prevent user creation if email exists
    When I enter the Password "potato"
    # needed to add 'User' because a problem with finding a name with spaces in it
    And I enter the User Password Confirmation "potato"
    When I enter the Email "ajd2215@columbia.edu"
    And I click "Create Account"
    Then I should be on the signup page

  Scenario: prevent user creation if password not entered
    When I enter the Email "rp2496@columbia.edu"
    When I click "Create Account"
    Then I should be on the signup page

  Scenario: prevent user creation if password and confirmation do not match
    When I enter the Email "rp2496@columbia.edu"
    When I enter the Password "potato1"
    And I enter the User Password Confirmation "potato2"
    And I click "Create Account"
    Then I should be on the signup page

  Scenario: create a new user successfully
    When I enter the Email "rp2496@columbia.edu"
    And I enter the Password "potato"
    And I enter the User Password Confirmation "potato"
    And I click "Create Account"
    Then I should be on the scripts page