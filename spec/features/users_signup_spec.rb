require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'User name', with: 'Deadpool'
    fill_in 'Email', with: "deadpool@marvel.com"
    fill_in 'Password', with: "maximumeffort", match: :first
    fill_in 'Password confirmation', with: "maximumeffort"
    click_button 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

end
