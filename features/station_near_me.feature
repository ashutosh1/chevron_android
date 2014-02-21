# @station_finder
# Scenario: touch stations near addres
#   Then I touch the "Stations Near Address" text
#   Then I enter text "san fr" into field with id "station_finder_search_edit_text"
#   Then I wait for the view with id "search_suggestions_list" to appear
#   Then I touch the "San Francisco, CA" text
#   Then I wait for 5 seconds
#   Then I click yes for disel
#   Then I wait for 10 seconds
#   When I centre the map at -12.345678, 123.456789
#   And I set the zoom level to 17
#   Then I should see the following markers:

#   | latitude   | longitude  | title       |
#   | -12.345678 | 123.456789 | Test Marker |
