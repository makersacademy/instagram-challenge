Then(/^I should not see a '(.+)' link$/) do |link|
  expect(page).not_to have_link link
end
Then(/^I should see a '(.+)' link$/) do |link|
  expect(page).to have_link link
end

Then(/^I should see the New comment page$/) do
  expect(current_path).to eq new_post_comment_path(@post.id)
end
