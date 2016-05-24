Feature: Tesla Demo
  Scenario:
#Open the website and navigate to the inventory page
    Given I open Chrome to https://www.teslamotors.com/
    And   I use the link Model S
    Then  I use the link Buy New
#narrow down the inventory
    And   I set the dropdown edit-status with Pre-owned
    And   I set the dropdown edit-hub with Atlanta
    And   I set the dropdown edit-paint randomly
    And   I tab to the next available element
    And   I click the button of id edit-submit
  #Realize you can't afford it and exit the browser
    Then  I close the browser