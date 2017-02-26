require 'rails_helper'

feature "adding comments to photos" do
  before :each do
    photo = FactoryGirl.create(:photo)
  end

  scenario "allows users to add a comment to a photo" do
    visit photos_path
    fill_in :comment_thoughts, with: "Dreaming about this cup of coffee"
    click_button "Leave Comment"
    expect(page).to have_content "Dreaming about this cup of coffee"
  end

  xscenario "allows user to edit a comment" do
    visit photos_path
    photo.comments.create(thoughts: "Morning cuppa!", photo_id: photo_id)
    find(".edit-comment").click_link "Edit"
    fill_in :comment_thoughts, with: "Morning glory!"
    click_button "Save"
    expect(page).to have_content "Morning glory!"
  end

  xscenario "allows user to delete a comment" do
    visit photos_path
    photo.comments.create(thoughts: "Morning cuppa!", photo_id: photo_id)
    find(".delete-comment").click_link "Delete"
    expect(page).not_to have_content "Morning cuppa!"
  end

end
