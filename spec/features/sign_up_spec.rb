require 'rails_helper'

RSpec.describe "Sign up", type: :feature do
  context "The sign up page" do
    before do
      visit "/"
    end

    it "has a username field" do
      expect(page).to have_field "Username"
    end

    it "has an email field" do
      expect(page).to have_field "Email"
    end

    it "has a password field" do
      expect(page).to have_field "Password"
    end

    it "has a confirm password field" do
      expect(page).to have_field "Confirm password"
    end

    it "has a submit button" do
      expect(page).to have_button "Sign up"
    end
  end

  # it "A user can sign up" do
  #   sign_up
  #   expect(page).to have_content "You have signed up succesfully"
  # end
end
