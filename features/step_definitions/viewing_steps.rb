Given(/^I am on the root page$/) do
  visit '/'
end

Given(/^there is a post to view$/) do
  @otherUser = FactoryGirl.create(:user,
                                  username: "fred",
                                  email: "fred@example.com")
  @post = FactoryGirl.create(:post, user_id: @otherUser.id)
end

Then(/^I should be able to see the post on the index page$/) do
  expect(page).to have_selector("img")
end

Then(/^I should not see any posts$/) do
  expect(page).not_to have_selector('img')
end
