require 'rails_helper'

feature 'create posts' do
  context 'no posts' do
    scenario 'should display information to publish a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_content 'Add your post'
    end
  end



  describe "Create posts with images" do
      scenario "displays a post with an image" do
        visit '/'
        click_link "Add your post"

      fill_in "Caption", with: "My new post"
      page.attach_file("post_image", Rails.root + 'app/assets/images/imagename.jpg')

      click_button "Create Post"
      expect(page).to have_content("My new post")
      expect(page).not_to have_content 'No posts yet'
     end
  end



end
