require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  scenario 'A user can sign in' do
    register
    click_button 'sign out'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Home#index')
    click_link 'sign in'
    expect(page).to have_current_path('/users/sign_in')
    expect(page).to have_content('Log in')
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Home#index')


  end
end
