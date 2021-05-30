require 'rails_helper'

feature 'Creating users' do
  background do
    visit '/'
    click_link 'Sign up'
  end
    scenario 'can create a new user' do
    fill_in 'Email', with: 'bobross@mail.com'
    fill_in 'Full Name', with: 'Bob Ross'
    fill_in 'Username', with: 'bobross'
    fill_in 'Password', with: 'password123', match: :first
    fill_in 'Password Confirmation', with: 'password123'

    click_button 'Sign up'
    expect(page).to(have_content('Welcome! You have signed up successfully.'))
  end
end
