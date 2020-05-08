require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'User can sign in to Instagram homepage and see their username' do
    User.create(first_name: 'first name', last_name: 'last name', username: 'username', email: 'user@email.com', password: 'password')
    visit '/'
    click_on 'Sign in'
    fill_in 'user[username]', with: 'username'
    fill_in 'user[password]', with: 'password'
    click_on 'Log in'
    expect(page).to have_content 'username'
    expect(page).not_to have_content 'Sign in'
  end
end
