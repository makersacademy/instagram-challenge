require 'rails_helper'

RSpec.feature 'Log out', type: :feature do
  scenario 'User is logged in, then clicks log out button, no longer sees their username' do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
    expect(page).to have_content 'davedude'
    click_on 'Log out'
    expect(page).to_not have_content 'davedude'
  end
end
