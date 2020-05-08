require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'User can sign up from Instagram homepage and see their username' do
    visit '/'
    click_on 'Sign up'
    fill_in 'user[first_name]', with: 'first name'
    fill_in 'user[last_name]', with: 'last name'
    fill_in 'user[email]', with: 'user@gmail.com'
    fill_in 'user[username]', with: 'username'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'username'
    expect(page).not_to have_content 'Sign up'
  end
end
