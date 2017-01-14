require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do

    it 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_content 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(name: 'Posh Coffee')
    end

    it 'should display the photos' do
      visit '/photos'
      expect(page).to have_content 'Posh Coffee'
      expect(page).to_not have_content 'No photos yet'
    end
  end

  context 'creating photos' do

    it 'should show a form that allows a user to enter a photo' do
      visit '/photos'
      click_link('Add a photo')
      fill_in 'Name', with: 'My adorable cat'
      click_button('Create Photo')
      expect(page).to have_content 'My adorable cat'
      expect(current_path).to eq '/photos'
    end
  end

end
