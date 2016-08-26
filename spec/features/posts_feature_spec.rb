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
    scenario "user can view posts" do
      visit "/posts"
      expect(page).to have_content "Selfie"
      expect(page).not_to have_content "No posts yet"
    end
  end

end
