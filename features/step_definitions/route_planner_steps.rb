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
  wait_for_elements_exist(["* id:'route_planner_progress_bar_layout'", "* id:'route_planner_progress_bar_status_text'"], :timeout => 10)
  check_element_exists("* id:'route_planner_progress_bar_layout'")
  check_element_exists("* id:'route_planner_progress_bar_status_text'")
  wait_for_elements_do_not_exist(["* id:'route_planner_progress_bar_layout'", "* id:'route_planner_progress_bar_status_text'"], :timeout => 30)
end

And(/^I should see map$/) do 
  check_element_exists("i")
end

And(/^I should see bottom cell$/) do
  check_element_exists("* id:'route_planner_tab_text_space'")
  check_element_exists("* id:'route_planner_tab_container_stations_text'")
  check_element_exists("* id:'route_planner_tab_container_time_text'")
  check_element_exists("* id:'route_planner_tab_container_distance_text'") 
end

When(/^I tap on bottom cell$/) do 
  touch("* id:'route_planner_tab_text_space'")
end
  
And(/^I should see "ADD TO ROUTE" button$/) do
  check_element_exists("* id:'station_list_item_direction_or_add_buttom'")
end

Given(/^I am on stations listing$/) do
  steps %{
    When I enter "San Francisco" in "start" location
    And I enter "Los Angeles" in "end" location
    Then I should see loader
    When I tap on bottom cell
  }
end

Given(/^I am on added stations listing$/) do 
  steps %{
    Given I am on stations listing
    When I tap on add to route
    Then I should see loader
    Then I touch the "Added Stations" text
  }
end

When(/^I tap on add to route$/) do 
  touch("* id:'station_list_item_direction_or_add_buttom' index:0")
end

And(/^I should see added stations count$/) do 
  txt = query("* id:'route_planner_added_stations_text'", "text").first
  expect(txt.to_i).to be_kind_of(Fixnum)
end

Then(/^I should see added stations list$/) do 
  steps %{
    And I wait for the view with id "station_list_item_collapsed" to appear
    And I should see station list
    And I should see remove button
  }
end

And(/^I should see remove button$/) do 
  check_element_exists("* id:'station_list_item_direction_or_add_buttom'")
end

And(/^I tap remove button$/) do 
  touch("* id:'station_list_item_direction_or_add_buttom'")
end

And(/^I should see "(.*)" flash message$/) do |msg|
  msg = query("* id:'route_planner_station_list_item_added_banner_message'").first["text"]
  expect(msg).to eq("Station Added to Route")
end