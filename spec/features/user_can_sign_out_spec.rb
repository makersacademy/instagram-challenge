require 'rails_helper'

RSpec.feature 'Sign out', type: :feature do
  before(:each) do
    user_params = {first_name: 'Tess', 
                   last_name: 'Tester', 
                   email: 'tess@tester.com', 
                   password: 'secure'}
    User.create(user_params)
  end

  scenario 'user clicks sign out link on welcome/images page' do
    visit '/sessions/new'
    fill_in 'session_email', with: 'tess@tester.com'
    fill_in 'session_password', with: 'secure'
    click_button 'Log In'
    click_link 'Sign out'
    expect(page).to have_content('Welcome to Instagramm')
  end
end
