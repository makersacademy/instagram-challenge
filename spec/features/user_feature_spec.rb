require 'rails_helper'

feature 'User' do
  context 'User comes to website and is not signed in' do
    scenario 'User can see sign in and sign up' do
      visit '/'
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end

    scenario 'User cannot see sign out' do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    scenario 'User can sign up' do
      visit '/'
      click_link('Sign up')
      fill_in('Name', with: 'Test Name')
      fill_in('Username', with: 'Test_user')
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')

      expect(current_path). to eq('/')
    end

    scenario 'User can sign in' do
      signup_user1
      click_link ('Sign out')
      click_link ('Sign in')
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with: 'testtest')
      click_button('Log in')
      expect(current_path).to eq('/')
      expect(page).not_to have_link('Sign in')
    end

    scenario 'cannot upload an image' do
      visit('/')
      click_link('Upload new image')
      expect(current_path).to eq('/users/sign_in')
    end
  end

  context 'User is signed in' do
    
  end
end