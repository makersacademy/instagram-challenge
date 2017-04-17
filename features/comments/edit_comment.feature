Feature: Editing a comment
  In order to update change my comment
  As a User
  I should be able to edit my comment on a post

  Scenario: A guest cannot edit a comment
    Given there is a post to view
    And a comment has been made
    And I am on the root page
    When I click the 'Detail' link
    Then I should not see a 'Edit Comment' link

  Scenario: A registered user cannot edit someone elses comment
    Given I am a registered user
    And there is a post to view
    And a comment has been made
    And I am logged in
    And I am on the root page
    When I click the 'Detail' link
    Then I should not see a 'Edit Comment' link
  
  Scenario: A registered user can edit their own comment 
    Given I am a registered user
    And there is a post to view
    And a comment has been made by me
    And I am logged in
    And I am on the root page
    When I click the 'Detail' link
    Then I should see a 'Edit Comment' link

  Scenario: A registered edits their own comment 
    Given I am a registered user
    And there is a post to view
    And a comment has been made by me
    And I am logged in
    And I am on the root page
    When I click the 'Detail' link
    Then I should see a 'Edit Comment' link
    When I click the 'Edit Comment' link
    Then I should see the Edit Comment Page
    When I fill the 'Body' field with 'Brilliant'
    And I click the 'Update Comment' button
    Then I should be on the root page
    When I click the 'Detail' link
    Then I should see the content 'Brilliant' on the page
