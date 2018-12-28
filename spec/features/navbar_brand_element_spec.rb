require 'rails_helper'

RSpec.feature "Navbar", type: :feature do
  scenario "Displays ChristaGram" do
    visit "/"
    expect(page).to have_content "ChristaGram"
  end

  xscenario "Displays user's first name if logged in" do
    visit "/"
    expect(page).to have_content "Hi, Joe!"
  end

  xscenario "Displays Sign Out if user is logged in" do
    visit "/"
    expect(page).to have_content "Sign Out"
  end

  xscenario "Displays Sign In and Up if user is logged out" do
    visit "/"
    expect(page).to have_content "Sign In"
    expect(page).to have_content "Sign Up"
  end
end
