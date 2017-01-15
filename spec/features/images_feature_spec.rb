require 'rails_helper'

feature 'photos' do
  context 'No images have been added' do
    scenario 'Should display a prompt to add an image' do
      visit '/photos'
      expect(page).to have_content 'No photos uploaded yet'
      expect(page).to have_link 'Add photo'
    end
  end

  context 'After a photo is added the user should see the photo' do

    before do
      Photo.create(description: 'Beach holiday')
    end

    scenario 'Add a photo and the title should appear on the page' do
      visit '/photos'
      expect(page).to have_content('Beach holiday')
      expect(page).not_to have_content('No photos uploaded yet')
    end
  end


  context 'Creating a photo' do
    scenario 'Prompts the user to fill out a form, then displays the image decription' do
      visit '/photos'
      click_link 'Add photo'
      fill_in 'Description', with: 'Amsterdam photo'
      click_button 'Create Photo'
      expect(page).to have_content('Amsterdam photo')
      expect(page).not_to have_content('No photos uploaded yet')
    end
  end

  context 'Reading a photo' do

    let!(:first_photo){ Photo.create(description:'Beach photo') }

    scenario 'Click on a photo description and the user is taken to the individual photo page' do
      visit '/photos'
      click_link 'Beach photo'
      expect(page).to have_content('Beach photo')
      expect(current_path).to eq"/photos/#{first_photo.id}"
    end
  end

  context 'Editing a photo' do

    before { Photo.create description: 'House photo'}

    scenario 'let a user edit a photo' do
      visit '/photos'
      click_link 'Edit House photo'
      fill_in 'Description', with: 'Garden photo'
      click_button 'Update Photo'
      expect(page).to have_content 'Garden photo'
    end
  end

  context 'Deleting a photo' do

    before { Photo.create desciption: 'House photo'}

    scenario 'let a user delete a photo' do
      visit 'photos'
      click_link 'Delete House photo'
      expect(page).not_to have_content 'House photo'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end
  


end
