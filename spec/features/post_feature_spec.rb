require 'rails_helper'

feature 'post' do
  before(:each) do
    visit '/'
  end
  context 'no images have been added' do
    scenario 'should display a prompt to add a restaurant' do
      expect(page).to have_content 'Nothing here, please upload an image'
      expect(page).to have_link 'New Post'
    end
  end
  context 'when image has been added' do
    before(:each) do
      click_link 'New Post'
      fill_in 'Title', with: 'Test'
      attach_file 'Image', './spec/images/test.jpg'
      fill_in 'Description', with: 'Test'
      click_button 'Create Post'
    end
    xscenario 'images added are displayed on screen' do
      expect(page).to have_css 'img[src*=\'test.jpg\']'
      expect(page).to have_content 'Test'
    end
    xscenario 'images can be deleted' do
      click_link 'Back'
      click_link 'Delete'
      click_button 'Create Post'
      expect(page).to_not have_css 'img[src*=\'test.jpg\']'
    end
    xscenario 'images can be edited' do
      click_link 'Edit'
      fill_in 'Title', with: 'Test2'
      click_button 'Update Post'
      expect(page).to have_content 'Test2'
    end
  end
  context 'when invalid information is inputed' do
    scenario 'no title' do
      click_link 'New Post'
      attach_file 'Image', './spec/images/test.jpg'
      fill_in 'Description', with: 'Test'
      click_button 'Create Post'
      expect(page).to have_content("Title can't be blank")
    end
    scenario 'no image attached' do
      click_link 'New Post'
      fill_in 'Title', with: 'Test'
      fill_in 'Description', with: 'Test'
      click_button 'Create Post'
      expect(page).to have_content("Image can't be blank")
    end
  end
end
