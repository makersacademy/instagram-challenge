require "rails_helper"

feature "Create listings" do
  scenario "prompts user to fill out a form, then displays the new restaurant" do
    add_listing
    expect(page).to have_content "Monday"
    expect(page).to have_content "10:00"
    expect(current_path).to eq "/listings"
  end
end
