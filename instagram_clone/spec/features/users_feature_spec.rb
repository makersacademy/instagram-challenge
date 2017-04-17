require 'rails_helper'

feature "User can sign in and out" do

  context "user not signed in" do
    scenario "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    scenario "must be logged in to add picture" do
      visit('/')
      click_link('Add a picture')
      expect(page).to have_content('Log in')
    end

    scenario "can only edit the title of a picture they uploaded" do
      visit('/')
      user = build :user2
      sign_up(user)
      expect(page).not_to have_link 'Edit Holiday'
    end
  end

  context "user signed in" do

    before do
      visit('/')
      user = build :user
      sign_up(user)
    end

    scenario "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    scenario "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    scenario "can edit the title of a picture they uploaded" do
      visit('/')
      click_link 'Add a picture'
      fill_in 'Title', with: 'Holiday'
      attach_file "picture_image", "spec/fixtures/image3.png"
      click_button 'Create Picture'
      expect(page).to have_link 'Edit Holiday'
    end

    scenario "can not edit the title of a picture they did not upload" do
      visit('/')
      click_link 'Add a picture'
      fill_in 'Title', with: 'Holiday'
      attach_file "picture_image", "spec/fixtures/image3.png"
      click_button 'Create Picture'
      click_link 'Sign out'
      user = build :user2
      sign_up(user)
      expect(page).not_to have_link 'Edit Holiday'
    end

  end
end
