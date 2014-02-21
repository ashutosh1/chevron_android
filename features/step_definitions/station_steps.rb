Then(/^I should see "(.*)" in popup$/) do |text|
  steps %{Then I should see "#{text}"}
end

Then(/^I should see a popup$/) do 
  #Verifying no stations popup by ok button
  steps %{Then I should see "OK"}
end

And(/^I tap "(.*)" in popup$/) do |text|
  steps %{Then I touch the "#{text}" text}
end

And(/^I tap on search field$/) do
  steps %{Then I press view with id "station_finder_search_edit_text"}
end

When(/^I enter text "(.*?)" in search field$/) do |text|
  steps %{Then I enter text "#{text}" into field with id "station_finder_search_edit_text"}
end

Then(/^I should see (\d+) stations in station list$/) do |num|
  expect(query("* id:'station_list_item_collapsed'").count).to eq(num.to_i)
end

And(/^I should see "(.*)" station having number (\d+)$/) do |order, num|
  icon_num = query("TextView index:0").first["text"]
  expect(icon_num).to eq(num)
end

When(/^I scroll to bottom$/) do
  size = query("* id:'station_list_item_collapsed'").count
  while size > 1 do
    performAction('scroll_down')
    size = query("* id:'station_list_item_collapsed'").count
  end
end

#Filter steps
And(/^I search the station with location "(.*)"$/) do |text|
  steps %{
    Then I enter text "#{text[0..-5]}" into field with id "station_finder_search_edit_text"
    And I wait for the view with id "search_suggestions_list" to appear
    And I touch the "#{text}" text
    And I wait for diesel only bar and click no
    Then I should see 3 stations in station list
  }
end

And(/^I wait for diesel only bar and click no$/) do 
  steps %{Then I wait for the view with id "station_list_item_collapsed" to appear}
  if !query("* id:'diesel_only_bar_layout'").empty?
    steps %{And I click "NO" for "disel"}
  end
end


When(/^I apply "(.*)" filter only$/) do |filter|
end

Then(/^I should see stations having at least "(.*)" services$/) do |filter|

end

#Station List Steps
Then(/^I should see first station highlighted$/) do
  id = query("TextView index:0").first["id"]
  expect(data_for("default/highlighted_icon")["icon_ids"]).to include(id)
end

When(/^I scroll the list$/) do 
  steps %{Then I scroll down}
end

When(/^I tap on station cell$/) do 
  touch("* id:'station_list_item_collapsed'")
end 

#In case of service icon, only verifying presence of icon, not verifying whether they faded or not.
Then(/^I should see station detail$/) do 
  steps %{
    Then I should see street address in cell
    And I should see city in cell
    And I should see distance from current location in cell
    And I should see direction button in detail view
    And I should see all services icon
  }
end

And(/^I should see all services icon$/) do 
  data_for("default/all_service_icon")["service_icon_ids"].each do |icon_id|
    check_element_exists("* id:'#{icon_id}'")
  end
end

And(/^I close the station detail view$/) do 
  steps %{And I wait for the view with id "station_finder_detail_fragment_close_button" to appear}
  touch("* id:'station_finder_detail_fragment_close_button'")
end

And(/^I should see direction button in detail view$/) do 
  check_element_exists("* id:'station_finder_detail_fragment_direction_buttom'")
end

Then(/^I should see station list$/) do 
  steps %{And I wait for the view with id "station_list_item_collapsed" to appear}
  check_element_exists("* id:'station_list_item_collapsed'")  
end

And(/^I should see street address in cell$/) do
  street = query("* id:'station_list_item_street_address' index:0", "text")
  expect(street).to be_truthy
end
  
And(/^I should see city in cell$/) do
  city = query("* id:'station_list_item_city_address' index:0", "text")
  expect(city).to be_truthy
end

And(/^I should see brand in cell$/) do
  brand = query("* id:'station_list_item_brand' index:0").first["text"]
  expect(data_for("default/station_brands")["brands"]).to include(brand)
end

And(/^I should see distance from current location in cell$/) do 
  distance = query("* id:'station_list_item_distance' index:0", "text")
  expect(distance).to be_truthy
end

#Not verifying color of icons, will only check presence
And(/I should see service icons in cell$/) do 
  data_for("default/station_list_service_icon")["icon_ids"].each do |icon|
    check_element_exists("* id:'#{icon}' index:0")
  end
end

And(/^I should see direction button$/) do 
  check_element_exists("* id:'station_list_item_direction_or_add_buttom'")
end

When(/^I tap on second station cell$/) do 
  @station_name = query("* id:'station_list_item_street_address' index:1").first["text"]
  touch("* id:'station_list_item_collapsed' index:1")
  steps %{And I wait for the view with id "station_finder_detail_fragment_close_button" to appear}
end 

Then(/^I should see second station moved to first place in list$/) do 
  steps %{And I wait for the view with id "station_list_item_collapsed" to appear}
  first_station_name = query("* id:'station_list_item_street_address' index:0").first["text"]
  expect(@station_name).to eq(first_station_name)
end

Then(/^I should see top station highlighted$/) do 
  steps %{
    And I tap on station cell
    And I wait for the view with id "station_finder_detail_fragment_close_button" to appear
    And I close the station detail view
    And I wait for the view with id "station_list_item_collapsed" to appear
    Then I should see first station highlighted
  }
end