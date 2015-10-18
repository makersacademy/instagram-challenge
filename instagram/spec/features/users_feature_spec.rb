require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the home page' do
    it 'should see a "sign in" link and a "sign up" link' do
      visit '/'
      expect(page).to have_link("Sign in")
      expect(page).to have_link("Sign up")
    end
    it 'should not see a "sign out" link' do
      visit '/'
      expect(page).not_to have_link("Sign out")
    end
  end

  context "user signed in on homepage" do
    before do
      visit ('/')
      click_link("Sign up")
      fill_in("Email", with: "test@example.com")
      fill_in("Password", with: "testtest")
      fill_in("Password confirmation", with: "testtest")
      click_button("Sign up")
    end

    it 'should see a "Sign out" link' do
      visit '/'
      expect(page).to have_link("Sign out")
    end

    it 'should not see a "sign in" link and a "sign up" link' do
      visit('/')
      expect(page).not_to have_link("Sign in")
      expect(page).not_to have_link("Sign up")
    end
  end
end

feature 'User cannot upload photos unless signed in' do
  scenario "No link should exist for uploading picture" do
    visit('/')
    expect(page).not_to have_link("New Post")
  end
end
