require 'rails_helper'
feature 'User' do
  
  before(:each) do
    visit('/')
  end

  context "user not signed in and on the homepage" do
    scenario "user should see a link to sign up" do
      expect(page).to have_link('Sign up')
    end
    scenario "user should see link to sign in" do
      expect(page).to have_link('Sign in')
    end
  end

  context "user is signed in and on the homepage" do
    before(:each) do
      sign_up
    end
    scenario "they should see sign out link" do
      expect(page).to have_link('Sign out')
    end

    scenario "they should not see a sign in link or a sign up link" do
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end