require 'rails_helper'

RSpec.feature 'Registration', type: :feature do
  scenario 'Can fill in registration form with details to create account' do
    visit '/welcome/home'
    click_link 'Sign Up'
    fill_in 'users_first_name', with: 'Tess'
    fill_in 'users_last_name', with: 'Tester'
    fill_in 'users_email', with: 'tess@tester.com'
    fill_in 'users_password', with: 'secure'
    click_button 'Save Users'
    expect(page).to have_content('Welcome to Instagramm')
  end
end
