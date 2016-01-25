require 'rails_helper'

feature 'post' do
  before(:each) do
    visit '/'
    user = FactoryGirl.create(:user)
    login_as(user)
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
    scenario 'images added are displayed on screen' do
      expect(page).to have_css 'img[src*=\'test.jpg\']'
      expect(page).to have_content 'Test'
    end
    scenario 'images can be deleted' do
      click_link 'Back'
      click_link 'Delete'
      click_button 'Create Post'
      expect(page).to_not have_css 'img[src*=\'test.jpg\']'
    end
    scenario 'images can be edited' do
      click_link 'Edit'
      fill_in 'Title', with: 'Test2'
      click_button 'Update Post'
      expect(page).to have_content 'Test2'
    end
    scenario 'image can only be edited and deleted by the user that made them' do
      click_link('Sign out')
      click_link('Sign up')
      fill_in('Email', with: 'test3@example.com')
      fill_in('Password', with: 'testtest3')
      fill_in('Password confirmation', with: 'testtest3')
      click_button('Sign up')
      expect(page).to_not have_link 'Delete'
      expect(page).to_not have_link 'Edit'
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
