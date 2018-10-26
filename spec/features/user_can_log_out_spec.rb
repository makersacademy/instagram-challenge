# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Log out', type: :feature do
  scenario 'Can Log out' do
    visit '/'
    click_on 'Sign up'
    fill_in 'user_email', with: 'hello@world.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    click_on 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
end
