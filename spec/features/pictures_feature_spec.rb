require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'displays a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'adding pictures' do
    scenario 'submitting with no image attached to picture form' do
      visit '/pictures'
      click_link 'Add a picture'
      click_button 'Create Picture'
      expect(page).to have_content '1 error prevented the picture from being saved: Image can\'t be blank'
    end

    scenario 'adding and viewing a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file "picture_image", "spec/pictures/test_picture.jpg"
      click_button "Create Picture"
      expect(page).to have_css("img[src*='test_picture.jpg']")
    end

    scenario 'adding and viewing multiple pictures' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file "picture_image", "spec/pictures/test_picture.jpg"
      click_button "Create Picture"
      click_link 'Add a picture'
      attach_file "picture_image", "spec/pictures/test_picture2.jpg"
      click_button "Create Picture"
      expect(page).to have_css("img[src*='test_picture.jpg']")
      expect(page).to have_css("img[src*='test_picture2.jpg']")
    end
  end

  context 'viewing pictures' do
    scenario "let's users view a picture" do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file "picture_image", "spec/pictures/test_picture.jpg"
      click_button "Create Picture"
      click_link 'View picture test_picture.jpg'
    end
  end

  context 'removing pictures' do
    scenario 'deleting a single picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file "picture_image", "spec/pictures/test_picture.jpg"
      click_button "Create Picture"
      expect(page).to have_css("img[src*='test_picture.jpg']")
      click_link 'Remove picture test_picture.jpg'
      expect(page).not_to have_css("img[src*='test_picture.jpg']")
    end

    scenario 'deleting multiple pictures' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file "picture_image", "spec/pictures/test_picture.jpg"
      click_button "Create Picture"
      click_link 'Add a picture'
      attach_file "picture_image", "spec/pictures/test_picture2.jpg"
      click_button "Create Picture"
      expect(page).to have_css("img[src*='test_picture.jpg']")
      expect(page).to have_css("img[src*='test_picture2.jpg']")
      click_link 'Remove picture test_picture.jpg'
      click_link 'Remove picture test_picture2.jpg'
      expect(page).not_to have_css("img[src*='test_picture.jpg']")
      expect(page).not_to have_css("img[src*='test_picture2.jpg']")
    end
  end
end
