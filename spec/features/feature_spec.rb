require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :feature do

  scenario 'has log-in message' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'can sign up' do
    visit '/user/sign_up'
    fill_in "user_username", with: 'Feature Test'
    fill_in "user_email", with: 'featuretest@test.com'
    fill_in "user_password", with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_button "Sign up"
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end


end
