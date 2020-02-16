require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User cannot delete other users posts' do
    skip 'Capybara issue'
    sign_up
    new_post
    click_link 'Logout'
    user2_sign_up
    visit '/posts'
    click_link 'Delete'
    expect(page).to have_content 'Hello, world!'
  end
end
