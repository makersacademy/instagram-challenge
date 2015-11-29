Feature: Delete a comment
  In order to retract a comment
  A User
  Should be able to delete a comment

  Scenario: A guest cannot delete a comment
    Given there is a post to view
    And a comment has been made
    And I am on the root page
    When I click the 'Detail' link
    Then I should not see a 'Delete Comment' link

  Scenario: A registered user cannot delete someone elses comment
    Given I am a registered user
    And there is a post to view
    And a comment has been made
    And I am logged in
    And I am on the root page
    When I click the 'Detail' link
    Then I should not see a 'Delete Comment' link

  Scenario: A registered user can delete their own comment
    Given I am a registered user
    And there is a post to view
    And a comment has been made by me
    And I am logged in
    And I am on the root page
    When I click the 'Detail' link
    Then I should see a 'Delete Comment' link

  Scenario: A registered deletes their own comment
    Given I am a registered user
    And there is a post to view
    And a comment has been made by me
    And I am logged in
    And I am on the root page
    When I click the 'Detail' link
    Then I should see a 'Delete Comment' link
    When I click the 'Delete Comment' link
    Then I should be on the root page
    When I click the 'Detail' link
    Then I should not see the content 'great' on the page
