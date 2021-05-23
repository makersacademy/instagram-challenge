require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'A user can sign up' do
    visit('/')
    expect(page).to have_content('Home#index')
    click_link 'User login'
    expect(page).to have_current_path('/users/sign_in')
    expect(page).to have_content('Log in')
    click_link 'Sign up'
    expect(page).to have_current_path('/users/sign_up')
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    click_button 'Sign up'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Home#index')
  end
end
