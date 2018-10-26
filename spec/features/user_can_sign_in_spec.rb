# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  scenario 'Can sign in' do
    visit '/'
    click_on 'Sign up'
    fill_in 'user_email', with: 'hello@world.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    click_on 'Logout'
    click_on 'Login'
    fill_in 'user_email', with: 'hello@world.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end
