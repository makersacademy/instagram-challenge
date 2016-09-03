require "rails_helper"

feature "users" do

  context "not signed in" do

    scenario "user should see sign in/sign up link" do
      visit "/"
      expect(page).to have_link("Sign up")
      expect(page).to have_link("Sign in")
    end

    scenario "user should not see sign out link" do
      visit "/"
      expect(page).not_to have_link("Sign out")
    end
  end

  context "signed in" do

    before do
      sign_up
    end

    scenario "user should see sign out link" do
      visit "/"
      expect(page).to have_link("Sign out")
    end

    scenario "user should not see sign in/sign up link" do
      visit "/"
      expect(page).not_to have_link("Sign up")
      expect(page).not_to have_link("Sign in")
    end
  end
end
