require 'rails_helper'

feature 'Create posts' do
  context 'new post' do
    scenario 'should display a prompt to add a photo and caption' do
      visit '/'
      click_link 'New Post'
      attach_file 'Image', "spec/files/images/canada.jpg"
      fill_in 'Caption', with: 'Snowboarding in Canada #winter'
      click_button 'Create Post'
      expect(page).to have_content 'Snowboarding in Canada #winter'
      expect(page).to have_css "img[src*='canada.jpg']"
      expect(current_path).to eq '/posts'
    end
  end

  context 'editing posts' do
    scenario 'user can edit image caption' do
      visit '/'
      click_link 'New Post'
      attach_file 'Image', "spec/files/images/canada.jpg"
      fill_in 'Caption', with: 'Snowboarding in Canada #winter'
      click_button 'Create Post'
      click_link 'Edit Post'
      fill_in 'Caption', with: 'Snowboarding in Canada #winter #mountains'
      click_button 'Update Post'
      expect(page).to have_content 'Snowboarding in Canada #winter #mountains'
      expect(current_path).to eq '/posts'
    end
  end
end
