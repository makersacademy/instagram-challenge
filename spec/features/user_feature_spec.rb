require 'rails_helper'

feature 'users' do
  context 'Signing in and out' do
    scenario 'has no sign out link when not signed in' do
      visit '/uploads'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
      expect(page).not_to have_link('Sign out')
    end

    scenario 'has no sign in/up link when signed in' do
      visit '/uploads'
      sign_up('adowellphoto@gmail.com', 'password')
      expect(page).to have_content("Signed in as adowellphoto@gmail.com")
      expect(page).to have_link("Sign out")
      expect(page).not_to have_link("Sign in")
      expect(page).not_to have_link("Sign up")
    end

    scenario 'can sign up and out and have the correct links appear' do
      visit '/uploads'
      sign_up('adowellphoto@gmail.com', 'password')
      sign_out
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
      expect(page).not_to have_link('Sign out')
    end
  end
end