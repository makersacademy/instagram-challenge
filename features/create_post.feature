Feature: Creating posts
  In order to contribute
  A User
  Should be able to create new posts

  Scenario: A guest cannot create a new post
    Given I am on the root page
    Then I should not see a link to create a post

  Scenario: A logged in user creates a new post
    Given I am a registered user
    And I am logged in
    And I am on the root page
    When I click the 'New' link
    Then I should see the new post page
    And  I fill the 'Description' field with 'Giraffe Dog'
    When I click the 'Create Post' button
    Then I should see the content 'Giraffe Dog' on the page
