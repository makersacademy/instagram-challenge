require "rails_helper"

feature "photos" do
  context "no photos have been added" do
    scenario "displays a prompt to add a photos" do
    # visit photos_path
    visit '/photos'
    expect(page).to have_content "No photos yet"
    expect(page).to have_link "Add Photo"
    end
  end
end
