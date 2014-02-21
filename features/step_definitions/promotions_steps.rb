Then(/^I should see promotions list or No promotions available message$/) do
  elem =  query("* text:'Featured Promotions'")
  elem2 =  query("* text:'ExtraMile Promotions'")
  if elem
    steps %{Then I should see "Featured Promotions"}
  elsif elem2
    steps %{Then I should see "ExtraMile Promotions"}
  else
    steps %{Then I should see "No promotions available!"}
  end
end

Then(/^I should see promotions list$/) do 
  begin
    performAction('wait_for_view_by_id', 'distance_bucket_row_text')
  rescue Exception => e 
    puts e.message
    steps %{Then I should see "No promotions available!"}
    raise "No promotions available, to execute further steps...."
  end
end

Then(/^I tap on promotion$/) do 
  touch("* id:'promotions_regional_row_main_section' index:0")
end

Then(/^I should see extended promotion details$/) do 
  expect(query("* id:'promotions_regional_row_extended_text' index:0").count).to eq(1)
end

And(/^I should see details button$/) do 
  expect(query("* id:'promotions_regional_row_extended_details_button' index:0").count).to eq(1)
end

And(/^I tap on details button$/) do 
  touch("* id:'promotions_regional_row_extended_details_button' index:0")
end

Then(/^I should see Detail popup$/) do 
  #verifying detail popup by using presence of close button
  check_element_exists("* id:'promotion_detail_dialog_close_button' index:0")
end

Then(/^I close the detail popup$/) do 
  touch("* id:'promotion_detail_dialog_close_button' index:0")
end
