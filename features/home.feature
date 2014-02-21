Feature: Home feature

Background: 
  Given I am on home page

Scenario: As a user I should see home page of Chevron-anroid app
  Then I see "Stations Near Me"
  Then I see "Stations Near Address"
  Then I see "Route Planner"
  Then I see "Credit Card"
  Then I see "Promotions"
  Then I see "Settings"

Scenario: touch stations near me
  Then I touch the "Stations Near Me" text
  Then I should see "No stations found!"
  Then I should see search field for location

Scenario: touch stations near addres
  Then I touch the "Stations Near Address" text
  Then I should see "Current Location"
  Then I should see search field for location

Scenario: touch route planner
  Then I touch the "Route Planner" text
  Then I should see "Create a route."
  Then I should see "Find stations."
  Then I should see "Notify when close."

Scenario: touch credit card
  Then I touch the "Credit Card" text
  Then I should see "Two great choices from"
  Then I should see "Chevron and Texaco"

Scenario: touch promotions
  Then I touch the "Promotions" text
  Then I should see "Promotions" in header
  
Scenario: touch settings
  Then I touch the "Settings" text
  Then I should see "Use my location for\npromotions"
  Then I should see "Show me both Chevron \nand Texaco station results"
