require 'rails_helper'

RSpec.describe "Sign up", type: :feature do
  context "The sign up page" do
    before do
      visit "/"
    end

    it "Has a username field" do
      expect(page).to have_field "Username"
    end

    it "Has an email field" do
      expect(page).to have_field "Email address"
    end

    it "Has a password field" do
      expect(page).to have_field "Password"
    end

    it "Has a confirm password field" do
      expect(page).to have_field "Confirm password"
    end

    it "Has a submit button" do
      expect(page).to have_button "Sign up"
    end
  end
end
