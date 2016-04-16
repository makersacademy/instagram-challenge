require "rails_helper"

feature "adding comments" do
  let!(:photo) { FactoryGirl.create(:photo) }

  scenario "allows user to add a comment to a photo" do
    visit photos_path
    fill_in :comment_content, with: "Fluff!"
    click_button "Send"
    expect(page).to have_content "Fluff!"
  end

  xscenario "allows user to edit a comment" do
    visit photos_path
    photo.comments.create(content: "Fluff!", photo_id: photo.id)
    find(".edit-comment").click_link "Edit"
    fill_in :comment_content, with: "More fluff!"
    click_button "Save"
    expect(page).to have_content "More fluff!"
  end

  xscenario "allows user to delete a comment" do
    visit photos_path
    photo.comments.create(content: "Fluff!", photo_id: photo.id)
    find(".delete-comment").click_link "Delete"
    expect(page).not_to have_content "Fluff!"
  end
end
