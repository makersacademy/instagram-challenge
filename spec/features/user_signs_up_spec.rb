require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Sign Up' do

  scenario 'user can sign up' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user_username', with: 'squidward'
    fill_in 'user_email', with: 'tentacles@ink.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button "Go"
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

end
