Feature: MEW merge bag Free shipping threshold scenarios
 # Pre-requisite
  #1. FST promotions should be active in respective environment
  #2. FST products test data should be available

  @MEW_merge_bag @scenario_1 @ab_free_shipping
  Scenario Outline: Verify that free shipping promotion is applied in merge bag if threshold is met
    Given I visit the mobile web site as a registered user
    And I have "<segment_value>" for SEGMENT cookie
    And I add an "FST_product" product to my bag using mobile website and select checkout
    And I set "<qty>" in the shopping bag page
    And I close and reopen the browser
    And I visit the mobile web site as a guest user
    And I have "<segment_value>" for SEGMENT cookie
    And I sign in to my same profile using mobile website
    And I navigate to shopping bag page using mobile website
    Then I should see free shipping promotion applied in "shopping bag"
    
        Examples:
      | segment_value | qty |
      | 1490          | 6   |
      | 1614          | 4   |
      | 1615          | 2   |
      | 1616          | 1   |