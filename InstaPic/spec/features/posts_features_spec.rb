require 'rails_helper'

feature 'create posts' do
  context 'no posts' do
    scenario 'should display information to publish a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_content 'New Post'
    end
  end

  describe "Create posts with images" do
      scenario "displays a post with an image" do
        visit '/'
        click_link "New Post"
        fill_in "Caption", with: "My new post"
        page.attach_file("post_image", Rails.root + 'app/assets/images/imagename.jpg')
        click_button "Create Post"
        expect(page).to have_content("My new post")
        expect(page).not_to have_content 'No posts yet'
    end
      scenario "does not display a post without an image" do
        visit '/'
        click_link "New Post"
        fill_in "Caption", with: "My second post"
        click_button "Create Post"
        expect(page).not_to have_content "My second post"
    end
      scenario "user can view the picture in a separate window" do
        visit "/"
        click_link "New Post"
        fill_in "Caption", with: "My new post"
        page.attach_file("post_image", Rails.root + 'app/assets/images/imagename.jpg')
        click_button "Create Post"
        find(:css, 'img[src*="imagename.jpg"]').click
        expect(page).to have_content "My new post"
      end
  end


    describe "editing posts" do
      scenario "user wants to change the post" do
      visit '/'
      click_link "New Post"
      fill_in "Caption", with: "My new post"
      page.attach_file("post_image", Rails.root + 'app/assets/images/imagename.jpg')
      click_button "Create Post"
      click_link 'Edit'
      fill_in "Caption", with: "It's better now"
      click_button "Update Post"
      expect(page).to have_content "It's better now"
      expect(page).not_to have_content "My new post"
    end
    scenario "user wants to delete the post" do
      visit '/'
      click_link "New Post"
      fill_in "Caption", with: "My new post"
      page.attach_file("post_image", Rails.root + 'app/assets/images/imagename.jpg')
      click_button "Create Post"
      click_link "Delete"
      expect(page).not_to have_content "My new post"
      expect(page).to have_content "Post deleted successfully"
    end


  end






end
