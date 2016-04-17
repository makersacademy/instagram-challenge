require "rails_helper"

feature "adding comments" do
  let!(:photo) { FactoryGirl.create(:photo) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:comment) { FactoryGirl.create(:comment, photo: photo, user: user)}

  context "adding comments" do
    scenario "allows user to add a comment to a photo" do
      sign_in_as(user)
      visit photos_path
      fill_in :comment_content, with: comment.content
      click_button "Send"
      expect(page).to have_content "#{comment.user.username} #{comment.content}"
    end

    scenario "a guest cannot leave a comment" do
      visit photos_path
      expect(page).not_to have_field :comment_content
    end
  end


  scenario "allows user to edit a comment" do
    visit photos_path
    find(".edit-comment").click_link "Edit"

    puts current_url
    require 'pry'; binding.pry

    fill_in :comment_content, with: "More fluff!"
    click_button "Save"
    expect(page).to have_content "More fluff!"
  end

  scenario "allows user to delete a comment" do
    visit photos_path
    find(".delete-comment").click_link "Delete"
    expect(page).not_to have_content comment.content
  end
end
