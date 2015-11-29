Feature: Editing posts
  In order to update the contents of posts
  A user
  Should be able to edit posts

  Scenario: A guest cannot edit posts
    Given there is a post to view
    And I am on the root page
    Then I should not see a 'Edit' link 

  Scenario: Cannot edit if not the owner
    Given there is someone elses post to view
    And I am a registered user
    And I am logged in
    And I am on the root page
    Then I should not see a 'Edit' link 

  Scenario: Author edits the post description
    Given I am a registered user
    And there is a post of mine to view
    And I am logged in
    And I am on the root page
    When I click the 'Edit' link
    Then I should see the Edit page for the post
    When I fill the 'Description' field with 'new description'
    And I click the 'Update Post' button
    Then I should see the content 'new description' on the page
