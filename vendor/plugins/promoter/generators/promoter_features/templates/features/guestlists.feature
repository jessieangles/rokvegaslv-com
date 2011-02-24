Feature: Guest lists
  In order to direct Internet visitors to venues
  A visitor
  Should be able to sign up for a guest list

    Scenario: Visitor views the guestlist form
      Given that I am a web site visitor
      When I go to the guestlists page
      Then I should see a selector "#first"
      And I should see a selector "#last"
      And I should see a selector "#phone"
      And I should see a selector "#email"

    Scenario: Visitor does not provide all items
      Given that I am a web site visitor
      When I go to the guestlists page
      And I fill in "last" with "Test"
      And I fill in "phone" with "555 555 5555"
      And I fill in "email" with "test@test.com"
      And I fill in "email_confirm" with "test@test.com"
      And I press "create"
      Then I should see "Please provide all required items"

    Scenario: Visitor signs up to a guest list successfully
      Given that I am a web site visitor
      When I go to the guestlists page
      And I fill in "first" with "Test"
      And I fill in "last" with "Test"
      And I fill in "phone" with "555 555 5555"
      And I fill in "email" with "test@test.com"
      And I fill in "email_confirm" with "test@test.com"
      And I press "create"
      Then I should see "Thank You"
