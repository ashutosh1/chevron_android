Then(/^I should see "(.*)" is "(.*)"$/) do |setting_text, status|
  index = data_for("default/settings_button_index")["#{setting_text.downcase.split.join('_')}"]
  layout_elem = query("* id:'settings_toggle_layout' index:#{index}")
  button_elem = query("* id:'settings_toggle_button' index:#{index}")
  x_cordinate_of_layout = layout_elem.first["rect"]["x"]
  x_cordinate_of_button = button_elem.first["rect"]["x"]
  if status == "disabled"
    expect(x_cordinate_of_button - x_cordinate_of_layout).to be < 10
  else
    expect(x_cordinate_of_button - x_cordinate_of_layout).to be > 10
  end
end

Then(/^I "(.*)" the "(.*)"$/) do |action, setting_text|
  index = data_for("default/settings_button_index")["#{setting_text.downcase.split.join('_')}"]
  touch("* id:'settings_toggle_button' index:#{index}")
end