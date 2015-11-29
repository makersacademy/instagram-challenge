Then(/^I should not see a link to edit the post$/) do
  expect(page).not_to have_link('Edit')
end

Then(/^I should see the Edit page for the post$/) do
  expect(current_path).to eq edit_post_path(@post.id)
end

When(/^I fill in the description with '(.+)'$/) do |description|
  fill_in 'Description', with: description
end

When(/^I click the '(.+)' button$/) do |button|
  click_button button
end

Then(/^I should see the content '(.+)' on the page$/) do |content|
  expect(page).to have_content content
end
