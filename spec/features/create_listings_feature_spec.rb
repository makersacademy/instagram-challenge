require "rails_helper"

feature "Create listings" do
  context "when not signed in" do
    before do
      visit "/listings"
      click_link "Add a class"
    end

    scenario "does not allow user to add a listing" do
      expect(page).to have_content "You need to sign in or sign up before continuing."
      expect(current_path).not_to eq "/listings/new"
    end
  end

  context "when signed in" do
    before do
      sign_up
    end

    scenario "prompts user to fill out a form, then displays the new listing" do
      add_listing
      expect(page).to have_content "Monday"
      expect(page).to have_content "10:00"
      expect(current_path).to eq "/listings"
    end
  end
end
