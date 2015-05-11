require 'rails_helper'

feature 'User management' do

  context "when user not signed in" do

    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    it "asked to sign up or sign in to upload an image" do
      visit('/')
      click_link 'Upload Image'
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end

    it "has to sign up or sign in to comment on an image" do
      visit('/')
      expect(page).not_to have_link('Comment')
    end

    it "has to sign up or sign in to like an image" do
      visit('/')
      expect(page).not_to have_link('Like')
    end
  end

  context "when user signed in" do

    before do
      sign_up_and_sign_in
      create_an_image
    end

    it "should see 'sign out' link" do
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    it "should see link to upload an image" do
      visit('/')
      expect(page).to have_link('Upload Image')
    end

    it "should see link to comment on an image" do
      visit('/')
      expect(page).to have_link('Comment')
    end

    it "should see link to like an image" do
      visit('/')
      expect(page).to have_link('Like')
    end
  end

  context 'when an email address is already taken' do

    before do
      sign_up_and_sign_in
      sign_out
    end

    it 'it cannot be used to sign up again' do
      sign_up_and_sign_in
      expect(page).to have_content('Email has already been taken')
    end
  end
end
