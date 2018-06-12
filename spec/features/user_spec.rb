require 'rails_helper.rb'

describe 'User' do

  before(:each) do
    visit '/'
    click_link 'Register'
  end

  feature 'creating a new user' do
    scenario 'users can register' do
      fill_in 'Username', with: 'AndrewK'
      fill_in 'Email', with: 'test@yahoo.co.uk'
      fill_in 'Password', with: 'qwert123', match: :first
      fill_in 'Password confirmation', with: 'qwert123'
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
end
