require 'rails_helper'

feature 'Picture:' do
  context 'When no pictures added' do
    scenario 'prompts users to post a picture' do
      visit pictures_path
      expect(page).to have_content 'No picture has been added'
      expect(page).to have_link 'Post a picture'
    end
  end

  context "When a user visits the pictures page" do
    scenario 'user can post a picture with title and image' do
      post_picture_with_image
      expect(page).to have_xpath("//a[contains(@text, 'Bird')]")
      expect(page).to have_xpath("//img[contains(@src, 'bird.png')]")
    end

    scenario 'user can view a picture by clicking the image link' do
      post_picture_with_image
      image_with_link = find(:xpath, "//a[contains(@text, 'Bird')]")
      image_with_link.click
      expect(page).to have_content 'Bird'
      expect(page).to have_xpath("//img[contains(@src, 'bird.png')]")
    end
  end
end
