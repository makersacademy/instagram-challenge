require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Signing in', type: :feature do
  scenario 'Index should have a Sign In link to /signin' do
    visit '/'
    click_link 'Sign In'
    expect(current_path).to eq('/signin')
  end

  scenario 'Successfully signing in' do
    sign_up_user
    visit '/signin'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '123'
    click_button 'Sign In'
    expect(current_path).not_to eq('/signin')
    expect(page).to have_content('You have signed in')
  end

  scenario 'Unsuccessfully signing in' do
    sign_up_user
    visit '/signin'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '1234'
    click_button 'Sign In'
    expect(current_path).to eq('/signin')
    expect(page).to have_content('Email or password is incorrect')
  end
end
