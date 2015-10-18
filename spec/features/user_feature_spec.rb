require 'rails_helper'

feature 'User Features ' do


  context 'when visiting the home page' do

    scenario 'can see a sign up link' do
      visit root_path
      expect(page).to have_link "Sign up"
    end

    scenario 'user can sign up' do
      user = build(:user)
      sign_up(user)
      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    scenario "user can sign out" do 
      user = build(:user)
      sign_up(user)
      visit root_path
      click_link "Sign out"
      expect(page).to have_content "Signed out successfully."
    end

    scenario "users can sign in" do
      user = build(:user)
      sign_up(user)
      visit root_path
      click_link "Sign out"
      visit root_path
      sign_in(user)
      expect(page).to have_content "Signed in successfully."
    end

  end

  context 'when signed in' do
    
    scenario "users cannot see sign in or up buttons" do
      user = build(:user)
      sign_up(user)
      visit root_path
      expect(page).not_to have_link "Sign in"
      expect(page).not_to have_link "Sign up"
    end

  end

  context 'when signed out' do
    
    scenario "users can request a password reset" do
      user = build(:user)
      sign_up(user)
      visit root_path
      click_link "Sign out"
      request_forgotten_pass(user)
      expect(page).to have_content "You will receive an email 
      with instructions on how to reset your password in a few minutes."
    end

  end

  context 'when visiting the profile page' do
    
    scenario 'the user can go to their page' do
      user = build(:user)
      sign_up(user)
      visit root_path
      click_link "testtest@gmail.com"
      expect(page).to have_content "Profile"
    end

  end

end