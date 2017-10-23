require 'rails_helper'

feature 'Post' do

  context "no posts have been added" do
    scenario "should display a link to add a post" do
      visit '/posts/index'
      expect(page).to have_link 'New Post'
    end
  end

  context "Can add a new post" do
    scenario "Prompts user to fill a form" do
      visit '/posts/new'

    end
  end

  context "Posts have been created" do
    before do
      Post.create(title: "Dog", post: @post.id)
    end
    scenario "display posts" do
      visit "/posts"
      expect(page).to have_content("Dog")
      expect(page).not_to have_content("No posts yet")
    end
  end

end
