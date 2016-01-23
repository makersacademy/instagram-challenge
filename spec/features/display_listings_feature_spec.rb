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


end
