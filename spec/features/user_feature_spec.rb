require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_button('Sign In')
      expect(page).to have_button('Sign Up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_button('Sign Out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_button('Sign Up')
      fill_in('Email', with: 'james@email.com')
      fill_in('Password', with: 'james')
      fill_in('Password confirmation', with: 'james')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_button('Sign Out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
			expect(page).to have_content("Signed in as: james@email.com")
      expect(page).not_to have_button('Sign In')
      expect(page).not_to have_button('Sign Up')
    end
  end
end
