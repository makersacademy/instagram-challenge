require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/pictures'
      expect(page).to have_link 'Add a picture'
      expect(page).to have_content 'No pictures yet'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(name:'test',
                     avatar_file_name: 'test.jpg',
                     avatar_file_size: '10',
                     avatar_content_type: 'image/jpeg')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('test')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'viewing pictures' do

    let!(:test){Picture.create(name:'test',
                               avatar_file_name: 'test.jpg',
                               avatar_file_size: '10',
                               avatar_content_type: 'image/jpeg')}

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'view test'
      expect(page).to have_content 'test'
      expect(current_path).to eq "/pictures/#{test.id}"
    end
  end

  context 'uploading pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Avatar', 'spec/features/test.jpg'
      fill_in 'Name', with: 'test'
      click_button 'Create Picture'
      expect(page).to have_content 'test'
      expect(page).to have_css('img[src*="test.jpg"]')
    end
  end

  context 'an invalid picture' do
    it 'does not let you submit a blank name' do
      visit '/pictures'
      click_link 'Add a picture'
      click_button 'Create Picture'
      expect(page).to have_content 'error'
    end
    it 'does not let you select no iamge' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Name', with: 'test'
      click_button 'Create Picture'
      expect(page).to have_content 'error'
    end
  end

  context 'deleting pictures' do

    let!(:test){Picture.create(name:'test',
                               avatar_file_name: 'test.jpg',
                               avatar_file_size: '10',
                               avatar_content_type: 'image/jpeg')}

    scenario 'lets a user delete a picture' do
      visit '/pictures'
      click_link 'Delete test'
      expect(page).not_to have_content 'test'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end
end
