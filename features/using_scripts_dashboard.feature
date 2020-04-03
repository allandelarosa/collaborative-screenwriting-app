Feature: keep and display a collection of scripts on a dashboard

  As an amateur filmmaker
  So that I can start writing my script
  I want to create and edit a new script document

  Background:
    Given the following users exist:
      | username  | email   | password_digest  |
      | Faboi     | fa2505  | asdf             |
    Given the following scripts exist:
      | title           | author | last_edited | user_id |
      | Fa and the Bois | Faboi  | 0           | 0       |
    Then 1 seed user should exist
    And 1 seed script should exist
    Given I am on the signup page
    When I enter the Username "Ryan"
    And I enter the Email "rp2496"
    And I enter the Password "potato"
    And I enter the User Password Confirmation "potato"
    And I click "Sign up"
    Then I should be on the scripts page

  Scenario: do not see other users scripts
    Then I should not see "Fa and the Bois"
    And I should not see "Faboi"

  Scenario: create a new script to work on
    When I click "New Script"
    And I enter the Title "Script Title"
    And I enter the Author "Ryan"
    And I click "Save Changes"
    Then I should see "Script Title"
    # And I should see a new file in the amazon storage

  Scenario: delete an existing script
    When I click "New Script"
    And I enter the Title "Script Title"
    And I enter the Author "Ryan"
    And I click "Save Changes"
    And I click "Script Title"
    And I click "Delete"
    Then I should be on the scripts page
    And I should see "Script Script Title was deleted."
    When I click "New Script"
    And I enter the Title "Another Script"
    And I enter the Author "Ryan"
    And I click "Save Changes"
    Then I should not see "Script Title"

  Scenario: rename an existing script
    When I click "New Script"
    And I enter the Title "Script Title"
    And I enter the Author "Ryan"
    And I click "Save Changes"
    And I click "Script Title"
    And I click "Edit"
    And I enter the Author "Allan"
    And I click "Update Script Info"
    And I click "Back"
    Then I should be on the scripts page
    And I should see "Allan"
    And I should not see "Ryan"