Given /I am on the (.*) page/ do |page|
    visit "/#{page}"
end

Given /the following scripts exist/ do |scripts_table|
    scripts_table.hashes.each do |script|
        Script.create! script
    end
end

Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        User.create! user
    end
end

When /I enter the (.*) "(.*)"/ do |field, value|
    if field.match?(" ")
        field = field.downcase.tr(" ", "_")
    end
    page.fill_in field, with:value
end

Then /I should see "(.*)"/ do |content|
    assert page.has_content? content
end

Then /I should not see "(.*)"/ do |content|
    assert page.has_no_content? content
end

When /I click "(.*)"/ do |button|
    click_on button
end

When /I Log Out/ do
    find('#navbar-list-4').click
    click_on "Log Out"
end

When /I type "(.*)"/ do |text|
    # element = find('#editorjs').click
    #page.find('#test').native.send_keys(:left).perform
    # send_keys(element, "d")

    # there is some problem finding the correct div

    (find('#editorjs').click).set text
end

Then /I should be on the (.*) page/ do |page|
    current_path = URI.parse(current_url).path
    if page.eql? "editor"
        assert current_path.match? /\/scripts\/[0-9]+/
    else
        assert "/#{page}".eql? current_path
    end
end

Then /(.*) seed script[s]? should exist/ do |n_seeds|
    Script.count.eql? n_seeds.to_i
end

Then /(.*) seed user[s]? should exist/ do |n_seeds|
    User.count.eql? n_seeds.to_i
end

When /I change the (.*) to (.*)/ do |field, value|
    if field.match?(" ")
        field = field.downcase.tr(" ", "_").tr("\"", "")
    end
    css = "##{field}"
    find(css).set value
    # takes 1 sec to save these fields
    sleep 1
end