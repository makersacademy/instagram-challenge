require "rails_helper"

feature "home" do
  before { visit "/" }
  context "users see all required log in links on the home page" do
    it { is_expected.to have_link("Sign up") }
    it { is_expected.to have_link("Sign in") }
  end
  context "users can sign" do
    scenario "up" do
      click_link "Sign up"
      fill_in "Email", with: "Test@email.co.uk"
      fill_in "Password", with
    end
  end
end