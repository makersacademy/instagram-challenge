require "rails_helper"

RSpec.feature "User Authentication", :type => :feature do
  scenario "Sign up a new account" do
    sign_up("myusername", "myemail@example.com", "password123")

    expect(page).to have_text("Welcome! You have signed up successfully.")
  end
end
