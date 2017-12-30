Feature: Subscribe to email/sms
  Background:
    Given open the site

  Scenario Outline: Subscribe to email/sms
    Then close the newsletter pop-up
    And click on sign up now button from footer
    When user fill the email address filed on the pop-up
    And click on Submit button from the email pop-up
    When user verify the validation message for privacy policy on the pop-up
    Then check the checkbox Privacy policy on subscription email pop-up
    #Then check the sms checkbox on email pop-up
    #And click on Submit button from the email pop-up
   # Then user verifies the validation message for mobile phone number
    #When user fills mobile number on email pop-up with <mobile>
    Then user press on language drop-down on email pop-up and selects <language>
    And click on Submit button from the email pop-up
    Then user verify the thank you pop-up after email subscription
    And close the newsletter pop-up
    And site should be switched to <language> local

    Examples:
    |mobile    |language|
    |0658745896|English |