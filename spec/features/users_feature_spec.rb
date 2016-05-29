require 'rails_helper'

feature 'Creating a new user' do

  before(:each) do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user from the index page' do
    fill_in 'User name', with: 'Batman'
    fill_in 'Email', with: 'Letian@gmail.com'
    fill_in("Password", with: '123456', :match => :prefer_exact)
    fill_in("Password confirmation", with: '123456', :match => :prefer_exact)
    click_button 'Sign up'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'username must be longer than 3 characters' do
    fill_in 'User name', with: 'Bat'
    fill_in 'Email', with: 'Letian@gmail.com'
    fill_in("Password", with: '123456', :match => :prefer_exact)
    fill_in("Password confirmation", with: '123456', :match => :prefer_exact)
    click_button 'Sign up'
    expect(current_path).to eq '/users'
    expect(page).to have_content 'too short'
  end
end

feature 'User can sign in and out' do
  context 'User not sign in' do
    it 'should be able to see register and login link' do
      visit '/'
      expect(page).to have_link('Register')
      expect(page).to have_link('Login')
    end

    it 'should not see Logout link' do
      visit '/'
      expect(page).not_to have_link('Logout')
    end
  end

  context 'user signed in' do

    scenario 'user should be able to see sign out link' do

    end

    scenario 'user should not be able to see sign in and sign up link' do

    end
  end

end