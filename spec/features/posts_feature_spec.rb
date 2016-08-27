require "rails_helper"

feature "posts" do

  context "no posts made yet" do

    scenario "user is prompted for posts" do
      visit "/posts"
      expect(page).to have_content "No posts yet"
      expect(page).to have_content "Add an image"
    end
  end

  context "posts made" do

    before do
      Post.create(caption: "Selfie")
    end

    scenario "user can view list of posts" do
      visit "/posts"
      expect(page).to have_content "Selfie"
      expect(page).not_to have_content "No posts yet"
    end

    scenario "viewing individual images" do
      visit "/posts"
      click_link "Selfie"
      expect(page).to have_content "Selfie"
    end

    scenario "deleting images" do
      visit "/posts"
      click_link "Selfie"
      click_link "Delete"
      expect(page).to have_content "Image successfully deleted"
    end

  end

  scenario "adding images" do
    visit "/posts"
    click_link "Add an image"
    fill_in "Caption", with: "Selfie"
    click_button "Upload image"
    expect(page).to have_content "Selfie"
  end



end
