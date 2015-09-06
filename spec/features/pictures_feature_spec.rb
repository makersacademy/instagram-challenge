require 'rails_helper'

feature 'Image upload' do
  context 'no images have been uploaded' do
    scenario 'should display a prompt to upload an image' do
      visit '/photos'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Upload a new photo'
    end
  end

  context 'images have been added' do
    before do
      Photo.create(title: 'Tomato')
    end

    scenario 'display images' do
      visit '/photos'
      expect(page).to have_content('Tomato')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'viewing photos' do
    let!(:tomato) { Photo.create(title:'Tomato') }
    scenario 'titles are links' do
      visit '/photos'
      click_link 'Tomato'
      expect(page).to have_content 'Tomato'
      expect(current_path).to eq "/photos/#{tomato.id}"
    end
  end

  context 'uploading images' do
    scenario 'user can upload image with title' do
      # user = build :user
      # sign_up(user)
      visit '/photos'
      click_link 'Upload a new photo'
      fill_in 'Title', with: 'Tomato'
      attach_file("photo[image]", "spec/asset_specs/photos/tomato.jpg")
      click_button 'Upload'
      expect(page).to have_selector 'img'
      # expect(page.find('.RestaurantImage')['src']).to have_content 'KFC.jpg'
      # expect(page).to have_xpath("//img[@src='/spec/assets_specs/photos/KFC.jpg?1441369740']")
    end

     xscenario 'image does not display if no image uploaded' do
      # user = build :user
      # sign_up(user)
      visit '/photos'
      click_link 'Upload a new photo'
      fill_in 'Title', with: 'Tomato'
      click_button 'Upload'
      expect(page).not_to have_selector 'img'
      expect(page).to have_content 'Please upload an image'
      # expect(page.find('.RestaurantImage')['src']).to have_content 'KFC.jpg'
      # expect(page).to have_xpath("//img[@src='/spec/assets_specs/photos/KFC.jpg?1441369740']")
    end
  end

  context 'editing restaurants' do

  before do
    Photo.create title: 'Tomato'
  end

    scenario 'let a user edit a photo' do
      visit '/photos'
      click_link 'Tomato'
      click_link 'Edit'
      fill_in 'Title', with: 'Poetic tomatoes'
      click_button 'Update Photo'
      expect(page).to have_content 'Poetic tomatoes'
      expect(current_path).to eq '/photos'
    end
  end


end