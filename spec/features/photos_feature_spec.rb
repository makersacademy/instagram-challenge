require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'show display a button to upload photos' do
      visit '/photos'
      expect(page).to have_content 'No Photos Added'
      expect(page).to have_button 'Upload a Photo'
    end

    scenario 'clicking upload takes you to photos/new' do
      visit '/photos'
      click_button 'Upload a Photo'
      expect(current_path).to eq('/photos/new')
    end
  end
end


feature 'Adding Photos and posts' do
  scenario 'can add a photo and create post' do
    visit '/photos'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/friday.jpg")
    click_button 'Upload Photo'
    expect(page).to have_css("img[src*=friday.jpg']")
  end
end
