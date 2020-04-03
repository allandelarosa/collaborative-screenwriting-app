Feature: keep and display a collection of scripts on a dashboard

  As an amateur filmmaker
  So that I can start writing my script
  I want to create and edit a new script document

  Background:
    Given the following scripts exist:
      | title           | author | email   |
      | Fa and the Bois | Faboi  | ajd2215 |
    Then 1 seed script should exist
    Given I am on the scripts page

  Scenario: create a new script to work on
    When I click "Add new script"
    And I enter the Title "Script Title"
    And I enter the Author "Author Name"
    When I click "Save Changes"
    Then I should see "Script Title"
    And I should see "Author Name"
  #And I should see a new file in the amazon storage

  Scenario: delete an existing script
    When I click "Edit Fa and the Bois"
    And I click "Delete"
    Then I should be on the scripts page
    And I should not see "Fa and the bois"

  Scenario: rename an existing script
    When I click "Edit Fa and the Bois"
    And I click "Edit"
    And I enter the Author "Allan"
    And I click "Update Script Info"
    And I click "Back"
    Then I should be on the scripts page
    And I should see "Allan"