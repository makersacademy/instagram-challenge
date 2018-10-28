# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Welcome page', type: :feature do
  scenario 'Can log in' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user_email', with: 'tests@mail.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button 'Sign up'
    click_link 'Logout'
    click_link 'Login'
    fill_in 'user_email', with: 'tests@mail.com'
    fill_in 'user_password', with: 'test123'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    click_link 'Logout'
  end
end
