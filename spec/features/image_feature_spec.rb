require 'rails_helper'

feature 'Image' do
  context 'no images added yet' do
    scenario 'should have button to add images' do
      visit '/images'
      expect(page).to have_content('No images added yet')
      expect(page).to have_link('Upload new image')
    end
  end

  context 'images are uploaded but user is not logged in' do
    scenario 'should not see delete & comment button' do
    end
  end

  context 'user is logged in on website' do
    
    before do
      signup_user1
    end
    
    scenario 'user can add a image' do
      click_link('Upload new image')
      fill_in ('Name'), with: 'Testimage'
      fill_in ('Description'), with: 'Test description'
      attach_file 'image[image]', Rails.root + 'spec/support/uploads/test_image.jpg'
      click_button('Upload image')
      
      expect(current_path).to eq('/images')
      expect(page).not_to have_content 'No images added yet'
      expect(page).to have_content("Test_user")
      expect(page).to have_xpath("//img[contains(@src, 'test_image.jpg')]")
    end

    scenario 'user can delete image' do
      upload_image1
      click_link('Remove image')
      expect(page).to have_content('Image was removed')
      expect(page).not_to have_xpath("//img[contains(@src, 'test_image.jpg')]")
    end
  end

  context 'user can navigate to username homepage' do
    before do
      signup_user1  
    end

    scenario 'link beneath each picture to username' do
      upload_image1
      click_link('Test_user')
      expect(page).to have_content("Test_user")
    end
  end
end
