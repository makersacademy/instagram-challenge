require 'rails_helper'

require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'Can sign up from homepage' do
    visit '/'
    # click_button 'Sign up'
    expect(current_path).to eq('/users/sign_up')
    fill_in 'user_email', with: 'anna.cavalla@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully')
    expect(current_path).to eq('/')
  end

  xscenario 'Gets redirected to / when not signed in and viewing /posts' do
    visit '/posts'
    expect(current_path).to eq('/')
  end

  scenario 'Gets redirected to / when visting a page that doesnt exist' do
    visit '/foo'
    expect(current_path).to eq('/')
  end

  scenario 'cannot create an account with a password less than 6 characters' do
    visit '/'
    # click_button 'Sign up'
    expect(current_path).to eq('/users/sign_up')
    fill_in 'user_email', with: 'anna.cavalla@gmail.com'
    fill_in 'user_password', with: '12345'
    fill_in 'user_password_confirmation', with: '12345'
    click_button 'Sign up'
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end

  scenario 'cannot create an account with a password more than 10 characters' do
    visit '/'
    # click_button 'Sign up'
    expect(current_path).to eq('/users/sign_up')
    fill_in 'user_email', with: 'anna.cavalla@gmail.com'
    fill_in 'user_password', with: '12345678901'
    fill_in 'user_password_confirmation', with: '12345678901'
    click_button 'Sign up'
    expect(page).to have_content('Password is too long (maximum is 10 characters)')
  end

  scenario 'Cannot sign up with an invaild email' do
    visit '/'
    # click_button 'Sign up'
    expect(current_path).to eq('/users/sign_up')
    fill_in 'user_email', with: 'anna.cavalla'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Email is invalid')
  end
end
