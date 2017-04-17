Feature: Viewing posts
  In order to view the posts
  A visitor
  Should visit the index page

  Scenario: Viewing posts as a guest
    Given there is a post to view
    And I am on the root page
    Then I should be able to see the post on the index page

  Scenario: No posts to begin with
    Given I am on the root page
    Then I should not see any posts
