require 'calabash-android/calabash_steps'

Given(/^I am on home page$/)do 
end

When(/^I tap on Menu Button$/) do 
  touch("* id:'header_menu_button'")
end

Then(/^I should be on home page$/) do 
  steps %{
    Then I see "Stations Near Me"
    Then I see "Stations Near Address"
    Then I see "Route Planner"
    Then I see "Credit Card"
    Then I see "Promotions"
    Then I see "Settings"
  }
end

Then(/^I select "(.*)" from list "(.*)"$/) do |text, id|
  touch(query("* id:'#{id}'"))
end

Then(/^I click "(.*)" for "(.*)"$/)do |action, text|
  touch("* marked:'#{action.upcase}'")
end

Then(/^I should see search field for location$/) do
  check_element_exists("* id:'station_finder_search_edit_text'")
end

Then(/^I should see "(.*)" in header$/) do|expected_text|
  steps %{Then I should see "#{expected_text}"}
end

Then(/^I should see Menu Button in header$/) do
  check_element_exists("* id:'header_menu_button'")
end

And(/^I should see Filter Button in header$/) do
  check_element_exists("* id:'header_filter_button'")
  steps %{Then I should see "Filter" in header}
end

Then(/^I should be redirected to credit card "(.*)" page$/) do |page|
  url = data_for("default/credit_card_webview_page")[page.downcase.split.join("_")]
  performAction('wait', 10)
  expect(performAction('get_url')['message']).to start_with(url)
end