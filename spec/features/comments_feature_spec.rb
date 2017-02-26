require "rails_helper"

feature "adding comments" do
  include Helpers

  let!(:photo) { FactoryGirl.create(:photo) }

  context "adding comments" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:comment) { FactoryGirl.create(:comment, photo: photo, user: user)}

    scenario "allows user to add a comment to a photo" do
      user_sign_in(user)
      visit photos_path
      fill_in :comment_thoughts, with: comment.thoughts
      click_button "Leave Comment"
      expect(page).to have_content comment.thoughts
    end

    scenario "a visitor cannot leave a comment" do
      visit photos_path
      expect(page).not_to have_field :comment_thoughts
    end
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
    comment = FactoryGirl.create(:comment, photo: photo)

    find(".delete-comment").click_link "Delete"
    expect(page).not_to have_content comment.thoughts
  end
end
