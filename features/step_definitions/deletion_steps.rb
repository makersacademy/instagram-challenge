Then(/^I should not see a link to delete the post$/) do
  expect(page).not_to have_link("Destroy")
end

Given(/^I am a registered user$/) do
  @me = FactoryGirl.create(:user,
                           username: "norm",
                           email: "norm@example.com",
                           password: "12345678")
end
Given(/^there is a post of mine to view$/) do
  @post = FactoryGirl.create(:post, user_id: @me.id)
end

Given(/^there is someone elses post to view$/) do
  @otherUser = FactoryGirl.create(:user,
                                  username: "fred",
                                  email: "fred@example.com")
  @post = FactoryGirl.create(:post, user_id: @otherUser.id)
end

Given(/^I am logged in$/) do
  visit new_user_session_path
  fill_in 'Email', with: 'norm@example.com'
  fill_in 'Password', with: '12345678'
  click_button 'Log in'
  expect(page).to have_content('Signed in successfully.')
end

When(/^I click the '(.+)' link$/) do |link|
  click_link link
end


Then(/^I should be on the root page$/) do
  expect(current_path).to eq posts_path
end
