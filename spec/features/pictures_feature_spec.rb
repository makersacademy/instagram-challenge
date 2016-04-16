require 'rails_helper'

feature 'Picture:' do
  context 'When no pictures added' do
    scenario 'prompts users to post a picture' do
      visit pictures_path
      expect(page).to have_content 'No picture has been added'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'When a picture has been added' do
    let!(:picture) { Picture.create(title: 'My Picture') }

    scenario 'displays a title of a posted picture' do
      visit pictures_path
      expect(page).to have_link 'My Picture'
    end

    scenario 'title with a links takes a user to the picture page' do
      visit pictures_path
      click_link 'My Picture'
      expect(current_path).to eq picture_path(picture)
    end
  end

  context "When a user visits the pictures page" do
    scenario 'user can post a picture with title and image' do
      post_picture_with_image
      expect(page).to have_link 'My Picture'
      expect(page).to have_xpath("//img[contains(@src, 'bird.png')]")
    end

    scenario 'user can view a picture by clicking the title link' do
      post_picture_with_image
      click_link 'My Picture'
      expect(page).to have_content 'My Picture'
      expect(page).to have_xpath("//img[contains(@src, 'bird.png')]")
    end
  end
end
