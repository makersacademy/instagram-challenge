Then(/^I should not see the content '(.+)' on the page$/) do |content|
  expect(page).not_to have_content(content)
end
