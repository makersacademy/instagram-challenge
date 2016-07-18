require 'rails_helper'

feature 'instagram photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(description: 'My lovely cat')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('My lovely cat')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'uploading photos' do
    scenario 'prompts user to fill out a form, then displays the uploaded photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Description', with: 'My lovely cat'
      attach_file('photo_image', './app/assets/images/cat.jpg')
      click_button('Create Photo')
      expect(page).to have_content('My lovely cat')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'viewing photos' do

    let!(:cat) { Photo.create(description:'My lovely cat') }

    scenario 'lets a user view a photo' do
      visit '/photos'
      click_link 'My lovely cat'
      expect(page).to have_css('div#current-photo')
      expect(current_path).to eq "/photos/#{cat.id}"
    end
  end

  context 'editing photos' do

    before { Photo.create description: 'My lovely cat'}

    scenario 'let a user edit a photo description' do
      visit '/photos'
      click_link 'My lovely cat'
      click_link 'Edit description of this photo'
      fill_in 'Description', with: 'My weird cat'
      click_button 'Update Photo'
      expect(page).to have_content 'My weird cat'
      expect(current_path).to eq '/photos'
    end
  end

  context 'deleting photos' do
    before { Photo.create description: 'My lovely cat'}

    scenario 'removes a photo when a user clicks a delete button' do
      visit '/photos'
      click_link 'My lovely cat'
      click_link 'Delete this photo'
      expect(page).not_to have_content 'My lovely cat'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end
end
