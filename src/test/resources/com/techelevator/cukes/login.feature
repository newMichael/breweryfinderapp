Feature: As an Administrator or Brewer, I can “log in” to the system so that I can access
 functionality that isn’t available to me as an anonymous user. 

 Scenario: Brewer logs in
		Given I am a brewer logging in
		And I type in my username
		And I type in my password
		When I click the login button
		Then I am logged in