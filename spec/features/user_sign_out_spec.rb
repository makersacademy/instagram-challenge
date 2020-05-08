require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'User can sign in to Instagram homepage and see their username' do
    User.create(first_name: 'first name', last_name: 'last name', username: 'username', email: 'user@email.com', password: 'password')
    visit '/'
    click_on 'Sign in'
    fill_in 'user[username]', with: 'username'
    fill_in 'user[password]', with: 'password'
    click_on 'Log in'
    click_on 'Sign Out'
    expect(page).to have_content 'Sign in' 
    expect(page).not_to have_content 'username'
  end
end