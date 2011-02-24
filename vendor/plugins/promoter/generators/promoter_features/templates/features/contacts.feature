Feature: Contacts
  In order to collect a list of potential customers
  A visitor
  Should be able to sign up as a mailing list contact

    Scenario: Visitor views the contacts form
      Given that I am a web site visitor
      When I go to the contacts page
      Then I should see a selector "#first"
      And I should see a selector "#last"
      And I should see a selector "#phone"
      And I should see a selector "#email"

    Scenario: Visitor does not provide all items
      Given that I am a web site visitor
      When I go to the contacts page
      And I fill in "last" with "Test"
      And I fill in "phone" with "555 555 5555"
      And I fill in "email" with "test@test.com"
      And I fill in "email_confirm" with "test@test.com"
      And I press "create"
      Then I should see "Please provide all required items"

    Scenario: Visitor signs up to the contacts list successfully
      Given that I am a web site visitor
      When I go to the contacts page
      And I fill in "first" with "Test"
      And I fill in "last" with "Test"
      And I fill in "phone" with "555 555 5555"
      And I fill in "email" with "test@test.com"
      And I fill in "email_confirm" with "test@test.com"
      And I fill in "dob_year" with "1982"
      And I fill in "dob_month" with "4"
      And I fill in "dob_day" with "26"
      And I fill in "address_1" with "123 Anywhere Lane"
      And I fill in "city" with "Anytown"
      And I fill in "state" with "FL"
      And I fill in "zip" with "55555"
      And I press "create"
      Then I should see "Thank You"
