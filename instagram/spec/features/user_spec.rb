
require "rails_helper"

RSpec.feature "User sign up", type: :feature do
    scenario "User can access signup form" do
      visit '/'
      click_on "Sign Up"
      expect(page).to have_content("Sign up form")
  end
end
