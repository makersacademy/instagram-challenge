require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display no photos' do
      visit '/photos'
      expect(page).to have_content 'No photos added'
      expect(page).to have_link 'Add photo'
    end
  end

  context 'photo has been added' do
    before do
      Photo.create(caption: 'My pet')
    end
   scenario 'display photos' do 
      visit '/photos'
      expect(page).to have_content 'My pet'
      expect(page).not_to have_content 'No photos added'    
    end
  end


  context 'adding photos' do
    scenario 'add a Picture' do
      visit('/photos')
      click_link ('Add photos')
      attach_file 'Image', '/spec/waterpark.jpg'
      fill_in 'Caption', with: 'My first photo'
      click_button('Post')
      expect(current_path).to eq ('/photos')
      expect(page).to have_content('My first photo')
      expect(page).to have_css('.img-post')
    end
  end
end

