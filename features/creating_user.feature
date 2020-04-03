Feature: create a new user

  Background:
    Given the following users exist:
      | username  | email   | password_digest  |
      | Allan     | ajd2215 | asdf             |
    Then 1 seed user should exist
    Given I am on the signup page

  Scenario: create a new user
    When I enter the Username "Ryan"
    And I enter the Email "rp2496"
    And I enter the Password "potato"
    And I enter the User Password Confirmation "potato"
    And I click "Sign up"
    Then I should be on the scripts page

  Scenario: prevent user creation if email exists
    When I enter the Username "Not Allan"
    And I enter the Email "ajd2215"
    And I enter the Password "fdsa"
    And I enter the User Password Confirmation "fdsa"
    Then I should be on the signup page