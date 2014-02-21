Feature: Promotions feature

Background: 
  Given I am on home page
  Then I touch the "Promotions" text

Scenario: promotions page
  Then I should see Menu Button in header
  Then I should see "Promotions" in header

Scenario: promotions list
  Then I should see promotions list or No promotions available message

Scenario: promotions list details
  Then I should see promotions list
  Then I tap on promotion
  Then I should see extended promotion details
  And I should see details button
  And I tap on details button
  Then I should see Detail popup
  And I should see "Offer Details"
  Then I close the detail popup
  