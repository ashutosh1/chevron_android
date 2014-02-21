Feature: Settings feature

Background: 
  Given I am on home page
  Then I touch the "Settings" text

Scenario: settings page
  Then I should see Menu Button in header
  Then I should see "Settings" in header
  Then I should see "Use my location for\npromotions"
  Then I should see "Show me both Chevron \nand Texaco station results"
  Then I should see "Use GPS to track stations when application is running in background"
  Then I should see "PRIVACY POLICY"
  Then I should see "Version"
  
Scenario: default settings
  Then I should see "use my location for promotions" is "disabled"
  Then I should see "show me both station result" is "enabled"

Scenario: enable/disable use my location for promotions
  Then I "enable" the "use my location for promotions"
  Then I should see "Use my location for promotions" is "enabled"
  Then I "disable" the "use my location for promotions"
  Then I should see "Use my location for promotions" is "disabled"

Scenario: enable/disable show me both station result
  Then I "disable" the "show me both station result"
  Then I should see "show me both station result" is "disabled"
  Then I "enable" the "show me both station result"
  Then I should see "show me both station result" is "enabled"

Scenario: enable/disable Use GPS to track stations
  Then I "disable" the "Use GPS to track stations"
  Then I should see "Use GPS to track stations" is "disabled"
  Then I "enable" the "Use GPS to track stations"
  Then I should see "Use GPS to track stations" is "enabled"