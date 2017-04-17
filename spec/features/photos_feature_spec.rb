require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a photo'
    end
  end

  context 'viewing photos' do
    let!(:test_pic){Photo.create(image: File.new(Rails.root + 'spec/asset_specs/photos/test_photo.jpg'), name: 'sunset', description: 'A sweet sunset shot')}

    scenario 'lets a user view a photo' do
      visit '/photos'
      click_link 'sunset'
      expect(current_path).to eq("/photos/#{test_pic.id}")
      expect(page).to have_link 'Back to feed'
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('sunset')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'deleting photos' do

    scenario 'user can delete photo' do
      add_photo
      click_link 'Sunset'
      click_link 'Delete post'
      expect(page).not_to have_content('A sweet sunset shot')
      expect(page).to have_content('Photo deleted successfully')
    end

  end

  context 'adding photos' do
    before {Photo.create(image: File.new(Rails.root + 'spec/asset_specs/photos/test_photo.jpg'), name: 'sunset', description: 'A sweet sunset shot')}

    scenario 'prompts user to fill out a form, then displays the new photo' do
      visit '/photos'
      expect(page).to have_content 'A sweet sunset shot'
      expect(page).not_to have_content 'No photos yet'
      expect(current_path).to eq '/photos'
    end
  end
end

def add_photo
  visit '/photos'
  click_link "Post a photo"
  fill_in 'Name', with: 'Sunset'
  fill_in 'Description', with: 'A sweet sunset shot'
  attach_file 'photo_image', 'spec/asset_specs/photos/test_photo.jpg'
  click_button 'Create Photo'
end
