require "rails_helper"

feature "Display listings" do

  context "no listings have been added" do
    scenario "should display a prompt to add a listing" do
      visit "/listings"
      expect(page).to have_content "No classes yet!"
      expect(page).to have_link "Add a class"
    end
  end

  context "listings have been added" do
    before do
      sign_up
      add_listing
    end

    scenario "display listings" do
      visit "/listings"
      expect(page).to have_content("Monday 10:00")
      expect(page).to have_content("Tippee Toes")
      expect(page).not_to have_content("No classes yet")
    end
  end

  context "multiple providers have added listings" do
    before do
      sign_up
      add_listing
      click_link "Sign out"
      sign_up(email: "email@email.com", name: "Nimble Arts")
      add_listing(day: "Tuesday")
    end

    scenario "displays Nimble Arts listings" do
      click_link "Nimble Arts"
      expect(page).to have_content("Tuesday")
      expect(page).not_to have_content("Monday")
    end

    scenario "displays Tippee Toes listings" do
      click_link "Tippee Toes"
      expect(page).to have_content("Monday")
      expect(page).not_to have_content("Tuesday")
    end
  end



end
