require 'rails_helper'
require 'web_helpers'

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
      sign_up
      visit '/photos'
      click_link('Add a photo')
      fill_in 'Name', with: 'Posh Coffee'
      attach_file("photo[image]", Rails.root + "spec/fixtures/coffee.jpg")
      click_button('Create Photo')
    end

    it 'should display the photos' do
      visit '/photos'
      expect(page).to have_content 'Posh Coffee'
      expect(page).to_not have_content 'No photos yet'
    end

    it 'should allow a user to see a particular photo' do
      @photo = Photo.find_by(name: "Posh Coffee")
      visit '/photos'
      click_link 'Posh Coffee'
      expect(page).to have_content 'Posh Coffee'
      expect(page).to have_css 'img#show-photo'
      expect(current_path).to eq "/photos/#{@photo.id}"
    end

    it 'should not allow another user to edit a particular photo' do
      click_link('Sign out')
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'an@other.com')
      fill_in('Password', with: 'another')
      fill_in('Password confirmation', with: 'another')
      click_button('Sign up')
      visit('/')
      click_link('Posh Coffee')
      expect{ click_link('Delete') }.not_to change{Photo.count}
    end
  end

  context 'editing & deleting photos' do

    before do
      sign_up
      visit '/photos'
      click_link('Add a photo')
      fill_in 'Name', with: 'My adorable cat'
      attach_file("photo[image]", Rails.root + "spec/fixtures/cat.jpg")
      click_button('Create Photo')
    end

    it 'should allow a user to rename a photo' do
      @photo = Photo.find_by(name: 'My adorable cat')
      visit '/photos'
      click_link('My adorable cat')
      click_link('Rename')
      fill_in 'Name', with: 'A scruffy little cat'
      click_button 'Update Photo'
      expect(page).to have_content 'A scruffy little cat'
      expect(current_path).to eq "/photos/#{@photo.id}"
    end

    it 'should allow a user to delete a photo' do
      visit '/photos'
      click_link('My adorable cat')
      expect{ click_link('Delete') }.to change{Photo.count}.by(-1)
      expect(page).to_not have_content 'A scruffy little cat'
      expect(page).to have_content 'Photo deleted'
    end
  end

end
