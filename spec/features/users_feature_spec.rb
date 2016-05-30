require 'rails_helper'

feature 'Creating a new user' do

  # before(:each) do
  #   visit '/'
  #   click_link 'Register'
  # end

  scenario 'can create a new user from the index page' do
    sign_up
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'username must be longer than 3 characters' do
    sign_up(username: 'Bat')
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

    it 'click login should bring me to login page' do
      visit '/'
      click_link 'Login'
      expect(current_path).to eq('/users/sign_in')
    end

    it 'should not see Logout link' do
      visit '/'
      expect(page).not_to have_link('Logout')
    end
  end

  context 'user signed in' do
    before(:each) { sign_up }

    scenario 'user should be able to see sign out link' do
      expect(page).to have_link 'Logout'
    end

    scenario 'user should not be able to see sign in and sign up link' do
      expect(page).not_to have_link 'Register'
      expect(page).not_to have_link 'Login'
    end
  end

end