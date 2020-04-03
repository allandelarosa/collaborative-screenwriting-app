Feature: edit content of script

    Background:
        Given I am on the signup page
        When I enter the Username "Ryan"
        And I enter the Email "rp2496"
        And I enter the Password "potato"
        And I enter the User Password Confirmation "potato"
        And I click "Sign up"
        And I click "Add new script"
        And I enter the Title "Script Title"
        And I enter the Author "Ryan"
        And I click "Save Changes"

    Scenario: saving a line of text
        When I click "Script Title"
        And I type "This is a line of text"
        And I click "Save"
        And I click "Back"
        And I click "Script Title"
        Then I should see "This is a line of text"

    Scenario: changing format of a line

    Scenario: save multiple lines of text in correct order