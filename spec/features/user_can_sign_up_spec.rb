require 'rails_helper'

RSpec.feature 'User Sign Up', type: :feature do
  scenario 'the user is redirected to the sign up page if they visit another URL before signing up' do
    visit '/'
    expect(current_path).to eq '/users/sign_up'
  end

  scenario 'the user can see prompts for email and password on sign up page' do
    visit '/users/sign_up'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password confirmation'
  end

  scenario 'the user can only enter valid email' do
    visit '/users/sign_up'
    fill_in 'user_email', with: 'ruby'
    fill_in 'user_password', with: 'Password'
    fill_in 'user_password_confirmation', with: 'Password'
    click_button 'Sign up'
    expect(page).to have_content 'Email is invalid'
  end

  scenario 'the user can only enter a password between 6-10 characters' do
    visit '/users/sign_up'
    fill_in 'user_email', with: 'ruby@rails.com'
    fill_in 'user_password', with: '123456789123'
    fill_in 'user_password_confirmation', with: '123456789123'
    click_button 'Sign up'
    expect(page).to have_content 'Password is too long (maximum is 10 characters)'
  end

  scenario 'once signed in the user is redirected to the welcome page' do
    sign_up
    expect(current_path).to eq '/'
  end
end
