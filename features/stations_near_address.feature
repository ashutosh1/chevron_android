Feature: Station near address feature

Background: 
  Given I am on home page
  Then I touch the "Stations Near Address" text

Scenario: Stations near address page
  Then I should see Menu Button in header
  And I should see "Station Finder" in header
  And I should see Filter Button in header
  And I should see search field for location
  And I tap on search field
  Then I should see "Current Location"
  
Scenario: tap current location
  When I touch the "Current Location" text
  Then I should see a popup
  Then I should see "Sorry" in popup
  Then I should see "We couldn't find any stations near this location." in popup
  And I tap "OK" in popup
  Then I should see "No stations found!"

Scenario: tap on menu button
  When I tap on Menu Button
  Then I should be on home page

Scenario: tap on filter button
  When I press the "Filter" button
  Then I should see "Extra Mile"
  And I should see "Diesel"
  And I should see "Store"
  And I should see "Car Wash"
  
Scenario: serach the stations by location
  When I enter text "524 pecan street crowley" in search field
  And I wait for the view with id "search_suggestions_list" to appear
  And I touch the "524 Pecan Street, Crowley, TX" text
  And I wait for diesel only bar and click no
  Then I should see 3 stations in station list
  And I should see "first" station having number 1
  When I scroll to bottom
  Then I should see "last" station having number 25
  
