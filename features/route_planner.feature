Feature: Route planner feature

Background: 
  Given I am on home page
  Then I touch the "Route Planner" text

Scenario: Route planner page
  Then I should see Menu Button in header
  And I should see "Route Planner" in header
  And I should see Filter Button in header
  And I should see "Create a route."
  And I should see "Find stations."
  And I should see "Notify when close."
  And I should see "start" location field
  And I should see "end" location field
  And I should see from and destination icon 

Scenario: search the route
  When I enter "San Francisco" in "start" location
  And I enter "Los Angeles" in "end" location
  Then I should see loader
  And I should see map
  And I should see bottom cell 
  When I tap on bottom cell
  Then I should see "Station List"
  And I should see "Added Stations"
  And I should see stations listing
  And I should see "Add to Routes" button

Scenario: station detail view
  Given I am on stations listing
  When I tap on station cell
  Then I should see station detail
  And I close station detail view
  Then I should see stations list

Scenario: station detail view of added station
  Given I am on added stations listing
  When I tap on station cell
  Then I should see station detail
  And I close station detail view
  Then I should see added stations list

Scenario: add station to route
  Given I am on stations listing
  When I tap on add to route
  Then I should see loader
  And I should see "Station Added to Route"
  And I should see added stations count
  When I tap on added station
  Then I should see added stations list

Scenario: remove station to route
  Given I am on added stations listing
  Then I should see remove button
  Then I should see loader
  And I should see "Station Removed from Route"


