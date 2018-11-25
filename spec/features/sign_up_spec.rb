# frozen_string_literal: true

require 'rails_helper'

describe 'Sign up' do
  it 'Allows a user to sign up for an account' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Name', with: 'Caitlin Cooling'
    fill_in 'Email', with: 'caitlin@test.com'
    fill_in 'Password', with: 'caitlin123'
    fill_in 'user_password_confirmation', with: 'caitlin123'
    click_button 'Sign up'
    expect(page).to have_content 'Caitlin'
  end

  it "doesn't allow a user to sign up with invalid email" do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Name', with: 'Caitlin Cooling'
    fill_in 'Email', with: 'caitlin@test'
    fill_in 'Password', with: 'caitlin123'
    fill_in 'user_password_confirmation', with: 'caitlin123'
    click_button 'Sign up'
    expect(page).to have_content 'Email is invalid'
  end

  it "doesn't allow a user to sign up with invalid password" do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Name', with: 'Caitlin Cooling'
    fill_in 'Email', with: 'caitlin@test.com'
    fill_in 'Password', with: '123'
    fill_in 'user_password_confirmation', with: 'caitlin123'
    click_button 'Sign up'
    expect(page).to have_content 'Password is too short'
  end
end
