Feature: Adding a comment
  In order to interact with other users
  As a User
  I should be able to make a comment on a post

  Scenario: A guest cannot comment make a comment
    Given there is a post to view
    And I am on the root page
    Then I should not see a 'Comment' link

  Scenario: A registered user can leave a comment
    Given I am a registered user
    And there is a post to view
    And I am logged in
    And I am on the root page
    Then I should see a 'Comment' link

  Scenario: A comment can be seen on the detail page of the post
    Given I am a registered user
    And there is a post to view
    And I am logged in
    And I am on the root page
    When I click the 'Comment' link
    Then I should see the New comment page
    When I fill the 'Body' field with 'Great Picture'
    And I click the 'Create Comment' button
    Then I should be on the root page
    When I click the 'Detail' link
    Then I should see the content 'Great Picture' on the page
    
