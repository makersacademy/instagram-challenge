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

    scenario "adds a class listing" do
      add_listing
      expect(Listing.count).to eq(1)
    end
  end
end
