require "rails_helper"

feature "posts" do

  context "no posts made yet" do

    scenario "user is prompted for posts" do
      visit "/"
      expect(page).to have_content "No posts yet"
      expect(page).to have_content "Add an image"
    end

    scenario "adding an image" do
      sign_up
      add_image("Selfie")
      page.attach_file("post_image", Rails.root + "app/assets/images/smile.jpg")
      click_button "Upload image"
      expect(page).to have_css("img[src*='smile.jpg']")
    end

    scenario "adding image description" do
      sign_up
      add_image("Selfie")
      click_button "Upload image"
      expect(page).to have_content "Selfie"
    end

    scenario "image description cannot be too short" do
      sign_up
      add_image("Se")
      click_button "Upload image"
      expect(page).not_to have_content "Selfie"
      expect(page).to have_content "error"
    end

  end

  context "posts made" do

    before do
      Post.create(caption: "Selfie")
    end

    scenario "user can view list of posts" do
      visit "/"
      expect(page).to have_content "Selfie"
      expect(page).not_to have_content "No posts yet"
    end

    scenario "viewing individual images" do
      visit "/"
      click_link "Selfie"
      expect(page).to have_content "Selfie"
    end

    scenario "deleting images" do
      sign_up
      visit "/"
      click_link "Selfie"
      click_link "Delete"
      expect(page).to have_content "Image successfully deleted"
    end
  end
end
