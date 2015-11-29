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

  context "creating posts" do
    scenario "prompts user to fill out a form, then display new posts" do
      visit("/posts")
      click_link("Create a post")
      fill_in("Description", with: "My first post")
      click_button("Create Post")
      expect(page).to have_content("My first post")
      expect(current_path).to eq("/posts")
    end
  end
end