require 'rails_helper'

feature 'user can sign in and out' do
  context 'user not signd in and on homepage' do
    it "should see 'sign in' and 'sign up' link" do
      visit root_path
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit root_path
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'user signed in on homepage' do
    before do
      visit root_path
      click_link('Sign up')
      fill_in('Username', with: 'cat')
      fill_in('Email', with: 'cat@cat.com')
      fill_in('Password', with: 'catcat')
      fill_in('Password confirmation', with: 'catcat')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit root_path
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit root_path
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  context "user can sign up, sign out and then in again" do
    it 'will be signed in' do
      sign_up("bmo@bmo.com")
      click_link('Sign out')
      visit root_path
      click_link('Sign in')
      fill_in('Login', with: 'bmo@bmo.com')
      fill_in('Password', with: 'purrpurr')
      click_button('Log in')
      expect(current_path).to eq root_path
    end
  end

  context 'user can see all their own posts' do
    it 'will show all users posts in one place' do
      sign_up('toby@toby.com')
      visit root_path
      click_link('pixel')
      expect(current_path).to eq user_path
    end
  end
end
