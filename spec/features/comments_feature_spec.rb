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

  context "editing comments" do
    scenario "allows user to edit a comment" do
      sign_in_as(user)
      visit photos_path
      find(".edit-comment").click_link "Edit"
      fill_in :comment_content, with: "More fluff!"
      click_button "Save"
      expect(page).to have_content "More fluff!"
    end

    context "cannot edit other users' comments" do
      before do
        other_user = FactoryGirl.create(:user)
        sign_in_as(other_user)
      end

      scenario "cannot edit other users comments on user interface" do
        visit photos_path
        expect(page).not_to have_css ".edit-comment"
      end

      scenario "cannot edit other comments via a update request" do
        page.driver.submit :patch, comment_path(comment.id), status: "Hacking"
        expect(current_path).to eq photos_path
        expect(page).to have_content comment.content
        expect(page).not_to have_content "Hacking"
      end
    end
  end

  context "deleting comments" do
    scenario "allows user to delete a comment" do
      sign_in_as(user)
      visit photos_path
      find(".delete-comment").click_link "Delete"
      expect(page).not_to have_content comment.content
    end

    context "cannot delete other user's comments" do
      before do
        other_user = FactoryGirl.create(:user)
        sign_in_as(other_user)
      end

      scenario "cannot delete other users comments on user interface" do
        visit photos_path
        expect(page).not_to have_css ".delete-comment"
      end

      scenario "cannot delete other users comments via a delete request" do
        page.driver.submit :delete, comment_path(comment.id), {}
        expect(current_path).to eq photos_path
        expect(page).to have_content comment.content
      end
    end
  end
end
