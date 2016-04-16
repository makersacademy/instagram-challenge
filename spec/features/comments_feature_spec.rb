require "rails_helper"

feature "adding comments" do
  let!(:photo) { FactoryGirl.create(:photo) }

  context "adding comments" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:comment) { FactoryGirl.create(:comment, photo: photo, user: user)}

    scenario "allows user to add a comment to a photo" do
      sign_in_as(user)
      visit photos_path
      fill_in :comment_content, with: comment.content
      click_button "Send"
      expect(page).to have_content comment.content
    end

    scenario "a guest cannot leave a comment" do
      visit photos_path
      expect(page).not_to have_field :comment_content
    end
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
    comment = FactoryGirl.create(:comment, photo: photo)

    find(".delete-comment").click_link "Delete"
    expect(page).not_to have_content comment.content
  end
end
