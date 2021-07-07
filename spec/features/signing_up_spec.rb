require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Signing up', type: :feature do
  scenario 'Index should have a Sign Up link to /user/new' do
    visit '/'
    click_link 'Sign Up'
    expect(current_path).to eq('/users/new')
  end

  scenario 'Signing up with suitable credentials' do
    sign_up_user
    expect(current_path).not_to eq('/users/new')
    expect(page).to have_content('You have signed up')
  end

  scenario 'Signing up with unsuitable credentials' do
    visit '/users/new'
    fill_in 'user_name', with: 'test'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123'
    fill_in 'user_password_confirmation', with: '1234'
    click_button 'Sign Up'
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Passwords do not match')
  end
end
