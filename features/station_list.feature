Feature: verify stations list and station detail view

Background: 
  Given I am on home page
  Then I touch the "Stations Near Address" text
  And I search the station with location "524 Pecan Street, Crowley, TX"

Scenario: First station should be highlighted
  Then I should see first station highlighted
 
Scenario: On scrolling the list top station should be highlighted
  When I scroll the list
  Then I should see top station highlighted

Scenario: verify station detail
  When I tap on station cell
  Then I should see station detail
  And I close the station detail view
  Then I should see station list

Scenario: verify station detail in first station cell
  Then I should see first station highlighted
  And I should see street address in cell
  And I should see city in cell
  And I should see brand in cell
  And I should see distance from current location in cell
  And I should see service icons in cell
  And I should see direction button

Scenario: after closing the deatil view that sation should be in top
  When I tap on second station cell
  And I close the station detail view
  Then I should see second station moved to first place in list
  