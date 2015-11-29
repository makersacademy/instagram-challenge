require "rails_helper"

feature "posts" do
  context "no posts have been added" do
    scenario "display a link to add a post" do
      visit("/posts")
      expect(page).to have_link("Create a post")
    end

    scenario "display a message that there are no posts" do
      visit("/posts")
      expect(page).to have_content("There are no posts")
    end
  end

  context "posts have been added" do
    before do
      Post.create(description: "My first post")
    end

    scenario "display posts" do
      visit("/posts")
      expect(page).to have_content("My first post")
      expect(page).not_to have_content("There are no posts")
    end
  end
end