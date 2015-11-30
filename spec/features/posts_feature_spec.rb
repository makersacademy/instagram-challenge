require "rails_helper"

feature "posts" do
  context "no posts have been added" do
    scenario "display a link to add a post" do
      visit("/posts")
      expect(page).to have_link("Create Post")
    end

    scenario "display a message that there are no posts" do
      visit("/posts")
      expect(page).to have_content("There are no posts")
    end
  end

  context "posts have been added" do
    before { Post.create(description: "My first post") }

    scenario "display a description to posts" do
      visit("/posts")
      expect(page).to have_content("My first post")
      expect(page).not_to have_content("There are no posts")
    end
  end

  context "creating posts" do
    scenario "prompts user to fill out a form, then display new posts" do
      visit("/posts")
      click_link("Create Post")
      fill_in("Description", with: "My first post")
      click_button("Create Post")
      expect(page).to have_content("My first post")
      expect(current_path).to eq("/posts")
    end
  end

  context "viewing posts" do
    before { Post.create(description: "My first post") }

    scenario "lets a user to view a post" do
      visit("/posts")
      expect(page).to have_content("My first post")
    end
  end

  context "updating posts" do
    before { Post.create(description: "My first post") }

    scenario "let a user edit a post" do
      visit("/posts")
      click_link("Edit Post")
      fill_in("Description", with: "My edited post")
      click_button("Update Post")
      expect(page).to have_content("My edited post")
      expect(current_path).to eq("/posts")
    end
  end

  context "deleting posts" do
    before { Post.create(description: "My first post") }

    scenario "removes a post when a user clicks a delete link" do
      visit("/posts")
      click_link("Delete Post")
      expect(page).not_to have_content("My first post")
      expect(page).to have_content("Post deleted successfully")
    end
  end

  context "adding images" do
    scenario "let a user to add an image when he creates a post" do
      visit("/posts")
      click_link("Create Post")
      fill_in("Description", with: "My first post")
      attach_file("post[image]", File.expand_path("./spec/test.jpg"))
      click_button("Create Post")
      expect(page).to have_css("img[src*='test.jpeg']")
    end
  end
end