require "rails_helper"

RSpec.feature "User Authentication", :type => :feature do
  scenario "Log in on a created account" do
    sign_up("myusername", "myemail@example.com", "password123")
    click_on :navbar_log_out

    log_in("myemail@example.com", "password123")

    expect(page).to have_text("Signed in successfully.")
  end
end
