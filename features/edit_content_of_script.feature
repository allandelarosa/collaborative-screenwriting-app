Feature: edit content of script

    Background:
        Given I am on the signup page
        When I enter the Email "rp2496@columbia.edu"
        And I enter the Password "potato"
        And I enter the User Password Confirmation "potato"
        And I click "Create Account"
        And I click "New Script"

    Scenario: saving a line of text
        When I type "This is a line of text"
        And I click "Save"
        And I click "Back"
        And I click "Untitled"
        Then I should see "This is a line of text"

    Scenario: changing format of a line

    Scenario: save multiple lines of text in correct order