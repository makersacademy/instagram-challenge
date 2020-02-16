require 'rails_helper'
require_relative 'web_helpers'

RSpec.feature 'User', type: :feature do
  scenario 'Can sign up for account' do
    sign_up
    expect(page).to have_content('You have signed up successfully.')
  end

  scenario 'Cannot sign up with a password shorter than 6 characters' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'ben@test.com'
    fill_in 'Password', with: 'pas'
    fill_in 'Password confirmation', with: 'pas'
    click_button 'Sign up'
    expect(page).to have_content('Password is too short')
  end

  scenario 'Cannot sign up with a password that doesnt match' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'ben@test.com'
    fill_in 'Password', with: 'rightpassword'
    fill_in 'Password confirmation', with: 'wrongpassword'
    click_button 'Sign up'
    expect(page).to have_content('Password confirmation doesn\'t match')
  end

  scenario 'Cannot sign up with same email twice' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'ben@test.com'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign up'
    click_link 'Logout'
    click_link 'Sign Up'
    fill_in 'Email', with: 'ben@test.com'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign up'
    expect(page).to have_content('Email has already been taken')
  end
end
