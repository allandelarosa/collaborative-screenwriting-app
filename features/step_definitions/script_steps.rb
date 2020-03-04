Given /I am on the (.*) page/ do |page|
    visit "/#{page}"
end

Given /the following scripts exist/ do |scripts_table|
    scripts_table.hashes.each do |script|
        Script.create! script
    end
end

When /I enter the (.*) "(.*)"/ do |field, value|
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

Then /I should be on the (.*) page/ do |page|
    current_path = URI.parse(current_url).path
    assert "/#{page}".eql? current_path
end

Then /(.*) seed movie[s]? should exist/ do |n_seeds|
    Script.count.eql? n_seeds.to_i
end