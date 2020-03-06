Feature: edit content of script

    Background:
        Given the following scripts exist:
            | title           | author | email   |
            | Fa and the Bois | Faboi  | ajd2215 |
        Then 1 seed movie should exist
        Given I am on the scripts page

    Scenario: saving a line of text
        When I click "Edit Fa and the Bois"
        And I type "This is a line of text"
        And I click "Back"
        And I click "Edit Fa and the Bois"
        Then I should see "This is a line of text"

    Scenario: changing format of a line

    Scenario: save multiple lines of text in correct order