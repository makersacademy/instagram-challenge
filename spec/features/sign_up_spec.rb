# frozen_string_literal: true

require 'rails_helper'

describe 'Sign up' do
  it 'Allows a user to sign up for an account' do
    visit '/'
    fill_in 'Name', with: 'Caitlin Cooling'
    fill_in 'Email', with: 'caitlin@test.com'
    fill_in 'Password', with: 'caitlin123'
    click_button 'Sign Up'
    expect(page).to have_content 'Hi Caitlin Cooling'
  end

  it "doesn't allow a user to sign up with invalid email" do
    visit '/'
    fill_in 'Name', with: 'Caitlin Cooling'
    fill_in 'Email', with: 'caitlin@test'
    fill_in 'Password', with: 'caitlin123'
    click_button 'Sign Up'
    expect(page).to have_content 'Email is invalid'
  end
end
