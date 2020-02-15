# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'Can log out' do
    sign_up
    visit '/'
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end

  scenario 'Can log in' do
    sign_up
    visit '/'
    click_link 'Logout'
    click_link 'Login'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'Cannot log in with incorrect email' do
    sign_up
    visit '/'
    click_link 'Logout'
    click_link 'Login'
    fill_in 'Email', with: 'wrongemail@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'Cannot log in with incorrect password' do
    sign_up
    visit '/'
    click_link 'Logout'
    click_link 'Login'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
