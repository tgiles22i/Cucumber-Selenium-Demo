Feature: Sign Jenny Tutone up to learn about Tesla
  Scenario:
#Open the tesla motors website to
    Given I open Chrome to https://www.teslamotors.com/
    And   I use the link Model 3
    And   I use the link Stay Updated
#Fill out the form to recieve updates
    Then  I set the textbox edit-lastname-td to Tutone
    And   I set the textbox edit-firstname-td to Jenny
    And   I set the textbox edit-usermail-td to i-got-it@phone.com
    And   I set the textbox edit-phonenumber-td to 123-867-5309
    And   I set the textbox edit-zipcode-td to 14207
    Then  I click the button of id edit-submit-td-ajax
#Verify form was submitted
    Then I verify my submital with phrase You'll receive periodic updates and local event invitations.
    Then  I close the browser