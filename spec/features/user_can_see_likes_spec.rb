# frozen_string_literal: true

feature 'User Story 4 - Users can see likes', type: :feature do
  scenario 'Users see likes on posts' do
    log_in
    expect(find("#like_count1")).to have_content('1', count: 1)
    expect(find("#like_count2")).to have_content('2', count: 1)
  end
end
