Feature: Credit card feature

Background: 
  Given I am on home page
  Then I touch the "Credit Card" text

Scenario: credit card page header
  Then I should see Menu Button in header
  And I should see "Credit Card" in header

Scenario: credit card page content
  Then I should see "Two great choices from"
  And I should see "Chevron and Texaco"
  And I should see "Both the Credit Card & Visa Card Offer"
  And I should see "APPLY TODAY"
  And I should see "LOGIN"

Scenario: touch apply today
  Given I press the "APPLY TODAY" button
  Then I should be redirected to credit card "apply today" page
  And I go back

Scenario: touch login
  Given I press the "LOGIN" button
  Then I should be redirected to credit card "Login" page
  And I go back