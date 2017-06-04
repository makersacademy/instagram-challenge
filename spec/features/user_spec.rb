require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'user is not logged in' do
    visit '/'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'user signs up' do
    sign_up
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'user logs out' do
    sign_up
    click_on 'Logout'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'user logs in' do
    sign_up
    click_on 'Logout'
    log_in
    expect(current_path).to eq '/'
    expect(page).to have_content 'Signed in successfully.'
  end
  
end
