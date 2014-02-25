Feature: Serach station with filter

Background: 
  Given I am on home page
  Then I touch the "Stations Near Address" text
  And I search the station with location "524 Pecan Street, Crowley, TX"

@reinstall_application
Scenario: serach the stations by location and diesle service
  When I apply "diesel" filter only
  Then I should see stations having at least "diesel" services

@reinstall_application
Scenario: serach the stations by location and diesle service
  When I apply "Store" filter only
  Then I should see stations having at least "store" services

@reinstall_application
Scenario: serach the stations by location and diesle service
  When I apply "Extra Mile" filter only
  Then I should see stations having at least "Extra Mile" services

@reinstall_application
Scenario: serach the stations by location and diesle service
  When I apply "Car Wash" filter only
  Then I should see stations having at least "Car wash" services