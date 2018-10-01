require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  before(:each) do
    user_params = {first_name: 'Tess', 
                   last_name: 'Tester', 
                   email: 'tess@tester.com', 
                   password: 'secure'}
    User.create(user_params)
  end

  scenario 'user can fill in sign in form' do
    visit '/welcome/home'
    click_link 'Sign in'
    fill_in 'session_email', with: 'tess@tester.com'
    fill_in 'session_password', with: 'secure'
    click_button 'Log In'
    expect(page).to have_content('Welcome Tess')
  end
end
