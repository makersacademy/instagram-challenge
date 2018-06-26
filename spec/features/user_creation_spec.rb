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
      fill_in 'Password Confirmation', with: 'qwert123'
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'username must be entered to create an account' do
      fill_in 'Email', with: 'test@yahoo.co.uk'
      fill_in 'Password', with: 'qwert123', match: :first
      fill_in 'Password Confirmation', with: 'qwert123'
      click_button 'Sign up'
      expect(page).to have_content('can\'t be blank')
    end

    scenario 'username can\'t be too short' do
      fill_in 'Username', with: 'a'
      fill_in 'Email', with: 'test@yahoo.co.uk'
      fill_in 'Password', with: 'qwert123', match: :first
      fill_in 'Password Confirmation', with: 'qwert123'
      click_button 'Sign up'
      expect(page).to have_content('is too short (minimum is 4 characters)')
    end

    scenario 'username can\'t be too long' do
      fill_in 'Username', with: 'afdjbvkdhbvkhbsdfbvdkfhbvkhsbdvkhbdfhkvbdfkhbv'
      fill_in 'Email', with: 'test@yahoo.co.uk'
      fill_in 'Password', with: 'qwert123', match: :first
      fill_in 'Password Confirmation', with: 'qwert123'
      click_button 'Sign up'
      expect(page).to have_content('is too long (maximum is 16 characters)')
    end

    scenario 'password must be entered to create an account' do
      fill_in 'Username', with: 'testuser1'
      fill_in 'Email', with: 'email@icloud.com'
      click_button 'Sign up'
      expect(page).to have_content('can\'t be blank')
    end

    scenario 'password must be a minimum of 6 charachters' do
      fill_in 'Username', with: 'testuser'
      fill_in 'Email', with: 'email@icloud.com'
      fill_in 'Password', with: '12'
      fill_in 'Password Confirmation', with: '12'
      click_button 'Sign up'
      expect(page).to have_content('is too short (minimum is 6 characters)')
    end

    scenario 'password confirmation must match the original password' do
      fill_in 'Username', with: 'testuser'
      fill_in 'Email', with: 'email@icloud.com'
      fill_in 'Password', with: 'pass12'
      fill_in 'Password Confirmation', with: 'pass123'
      click_button 'Sign up'
      expect(page).to have_content('doesn\'t match Password')
    end
  end
end
