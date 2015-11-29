Then(/^I should not see a link to edit the post$/) do
  expect(page).not_to have_link('Edit')
end

Then(/^I should see the Edit page for the post$/) do
  expect(current_path).to eq edit_post_path(@post.id)
end

When(/^I fill the '(.+)' field with '(.+)'$/) do |field, text|
  fill_in field, with: text
end

When(/^I click the '(.+)' button$/) do |button|
  click_button button
end

Then(/^I should see the content '(.+)' on the page$/) do |content|
  expect(page).to have_content content
end
