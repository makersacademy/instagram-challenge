require "rails_helper"

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a sign in link and a sign up link" do
      visit "/"
      expect(page).to have_link "Sign in"
      expect(page).to have_link "Sign up"
    end

    it "should not see sign out link" do
      visit "/"
      expect(page).not_to have_link "Sign out"
    end
  end

  context "user signed in on the homepage" do
    before do
      visit "/"
      click_link "Sign up"
      fill_in :user_username, with: "skywalker"
      fill_in :user_email, with: "luke@starwars.com"
      fill_in :user_password, with: "j3di_temple"
      fill_in :user_password_confirmation, with: "j3di_temple"
      click_button "Sign up"
    end

    it "should see sign out link" do
      visit "/"
      expect(page).to have_link "Sign out"
    end

    it "should not see a sign in link and a sign up link" do
      visit "/"
      expect(page).not_to have_link "Sign in"
      expect(page).not_to have_link "Sign up"
    end
  end
end
