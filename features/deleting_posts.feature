Feature: Deleting posts
  In order to remove unwanted posts
  A user
  Should be able to delete posts

  Scenario: A guest cannot delete posts
    Given there is a post to view
    And I am on the root page
    Then I should not see a link to delete the post

  Scenario: Cannot delete if not the owner
    Given there is someone elses post to view
    And I am a registered user
    And I am logged in
    And I am on the root page
    Then I should not see a link to delete the post

  Scenario: Author deletes post
    Given I am a registered user
    And there is a post of mine to view
    And I am logged in
    And I am on the root page
    When I click the 'Destroy' link
    Then I should be on the root page
    And I should not see any posts

    
