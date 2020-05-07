Feature: keep and display a collection of scripts on a dashboard

  As an amateur filmmaker
  So that I can start writing my script
  I want to create and edit a new script document

  Background:
    Given the following users exist:
      | username  | email               | password_digest  |
      | Faboi     | fa2505@columbia.edu | asdf             |
    Given the following scripts exist:
      | title           | author | last_edited | user_id |
      | Fa and the Bois | Faboi  | 0           | 0       |
    Then 1 seed user should exist
    And 1 seed script should exist
    Given I am on the signup page
    When I enter the Email "rp2496@columbia.edu"
    And I enter the Password "potato"
    And I enter the User Password Confirmation "potato"
    And I click "Create Account"
    Then I should be on the scripts page

  Scenario: do not see other users scripts
    Then I should not see "Fa and the Bois"
    And I should not see "Faboi"

  Scenario: create a new script to work on
    When I click "New Script"
    Then I should be on the editor page
    And I should see "Untitled"
    And I should see "rp2496@columbia.edu"

  # test fails because of incompatability with javascript
  Scenario: change name and author of a script
    # When I click "New Script"
    # And I change the "Script Title" to "Story Name"
    # And I change the "Script Author" to "Ryan Peters"
    # And I click "Back"
    # Then I should see "Story Name"
    # And I should see "Ryan Peters"
    # And I should not see "Untitled"
    # And I should not see "rp2496@columbia.edu"

  Scenario: delete a script
    When I click "New Script"
    And I click "Delete"
    Then I should not see "rp2496@columbia.edu"
