require 'rails_helper'

feature "adding comments to photos" do
  before do
    photo = FactoryGirl.create(:photo)
  end

  scenario "allows users to add a comment to a photo" do
    visit photos_path
    fill_in :comment_thoughts, with: "Dreaming about this cup of coffee"
    click_button "Leave Comment"
    expect(page).to have_content "Dreaming about this cup of coffee"
  end
end
