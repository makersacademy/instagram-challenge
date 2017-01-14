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

  context 'viewing photos' do

    let!(:photo){ Photo.create(name: 'My adorable cat') }

    it 'should allow a user to see a particular photo' do
      visit '/photos'
      click_link 'My adorable cat'
      expect(page).to have_content 'My adorable cat'
      expect(current_path).to eq "/photos/#{photo.id}"
    end

  end

  context 'editing photos' do

    let!(:photo){ Photo.create(name: 'My adorable cat') }

    it 'should allow a user to rename a photo' do
      visit '/photos'
      click_link('Edit My adorable cat')
      fill_in 'Name', with: 'A scruffy little cat'
      click_button 'Update Photo'
      expect(page).to have_content 'A scruffy little cat'
      expect(current_path).to eq "/photos/#{photo.id}"
    end

  end

  context 'deleting photos' do

    let!(:photo){ Photo.create(name: 'My adorable cat') }

    it 'should allow a user to delete a photo' do
      visit '/photos'
      expect{ click_link('Delete My adorable cat') }.to change{Photo.count}.by(-1)
      expect(page).to_not have_content 'Delete My adorable cat'
      expect(page).to have_content 'Photo deleted'
    end
  end

end
