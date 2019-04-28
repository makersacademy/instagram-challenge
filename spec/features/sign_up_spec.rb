# frozen_string_literal: true

require "spec_helper"
require 'rails_helper'

feature 'Leads to sign up page' do
  scenario 'when clicking on user icon' do
    visit "/home/index"
    click_on(id: 'sign_up_link')
    expect(current_path).to eq('/users/sign_up')
  end
end

feature 'Users see a success message' do
  scenario 'after signing up' do
    visit "/users/sign_up"
    fill_in('user_email', with: 'test@test.com')
    fill_in('user_password', with: '123456')
    fill_in('user_password_confirmation', with: '123456')
    click_button('commit')
    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome! You have signed up successfully')
  end
end
