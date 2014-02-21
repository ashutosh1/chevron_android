And(/^I should see "(.*)" location field$/) do |field|
  input_field = data_for("default/route_planner_input")["#{field.downcase}"]
  check_element_exists("* id:'#{input_field}'")
end

And(/^I should see from and destination icon$/) do 
  data_for("default/route_planner_images")["from_and_destination_images"].each do |icon|
    check_element_exists("* id:'#{icon}'")
  end
end

When(/^I enter "(.*)" in "(.*)" location$/) do |location, position|
  input_field = data_for("default/route_planner_input")["#{position.downcase}"]
  tap("#{input_field}")
  steps %{
    Then I enter text "#{location}" into field with id "#{input_field}"
    And I wait for the view with id "search_suggestions_list" to appear
  }  
  touch("* id:'search_suggestions_list' index:0")
end

Then(/^I should see loader$/) do 
  sleep(3)
  check_element_exists("* id:'route_planner_progress_bar_layout'")
  check_element_exists("* id:'route_planner_progress_bar_status_text'")
  wait_for_elements_do_not_exist(["* id:'route_planner_progress_bar_layout'", "* id:'route_planner_progress_bar_status_text'"], :timeout => 20)
end