Then(/^I should not see a link to create a post$/) do
  expect(page).not_to have_link("New")
end

Then(/^I should see the new post page$/) do
  expect(current_path).to eq new_post_path
end
