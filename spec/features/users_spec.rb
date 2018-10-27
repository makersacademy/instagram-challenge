# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario 'redirect to sign in page unless logged in' do
    visit('/')
    expect(page).to have_current_path('/users/sign_in')
  end

  scenario 'User redirect to root after sign up' do
    sign_up_helper_correct
    expect(page).to have_current_path('/')
  end

  scenario 'User can sign in again after registering' do
    sign_up_helper_correct
    click_on('Log out')
    fill_in :user_email, with: "test@test.com"
    fill_in :user_password, with: "password"
    click_on('Log in')
    expect(page).to have_current_path('/')
  end

  scenario 'User can sign out' do
    sign_up_helper_correct
    click_on('Log out')
    expect(page).to have_current_path('/users/sign_in')
  end
end
