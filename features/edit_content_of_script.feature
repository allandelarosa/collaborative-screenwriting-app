Feature: edit content of script

    @skip_scenario
    Scenario:
        When I type "Scene name"
        And I click "Save changes"
        And I click "Edit Fa and the Bois"
        Then I should see "Scene name"