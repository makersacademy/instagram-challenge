# frozen_string_literal: true

feature 'User Story 4 - Users can see likes', type: :feature do
  scenario 'Users see likes on posts' do
    log_in
    expect(page).to have_content('Likes: 1', count: 1)
    expect(page).to have_content('Likes: 2', count: 1)
  end
end
