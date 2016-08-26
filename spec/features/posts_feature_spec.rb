require "rails_helper"

feature "posts" do

  context "no posts made yet" do
    scenario "user is prompted for posts" do
      visit "/posts"
      expect(page).to have_content "No posts yet"
      expect(page).to have_content "Add an image"
    end
  end

end
