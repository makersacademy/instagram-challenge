require 'rails_helper'

feature 'Creating a new user' do

  scenario 'can create a new user from the index page' do
    sign_up
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(User.count).to eq 1
  end

  scenario 'username must be longer than 3 characters' do
    sign_up(username: 'Bat')
    expect(current_path).to eq '/users'
    expect(page).to have_content 'too short'
    expect(User.count).to eq 0
  end

  scenario 'cannot sign up with an invalid email address' do
    sign_up(email:'123')
    expect(page).to have_content 'invalid'
    expect(User.count).to eq 0
  end
end

feature 'User can sign in and out' do
  context 'User not sign in' do
    it 'should be able to see register and login link' do
      visit '/'
      expect(page).to have_link('Register')
      expect(page).to have_link('Login')
    end

    it 'should not be able to see new post link' do
      visit '/'
      expect(page).not_to have_link('New Post')
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

    it 'should not be able to visit index' do
      visit '/'
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    it 'should not be able to create new post' do
      visit new_post_path
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
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

    scenario 'user should be able to log out' do
      click_link 'Logout'
      expect(current_path).to eq '/users/sign_in'
    end
  end

end