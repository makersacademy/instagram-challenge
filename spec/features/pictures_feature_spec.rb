require 'rails_helper'

describe 'Instagram s main page' do
  feature 'no picture have been added yet' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet!'
      expect(page).to have_link 'Add a picture'
    end
  end

  feature 'pictures have been added' do
    let!(:photo) { Picture.create(name: 'photo') }
  before do
    signing_up_and_in
  end
    # I wanted to do pic with url instead of a name at first.
    # didnt work. Need to ask Spike for advice.
    # body = [{
    #       :url => 'https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/7/000/1ef/1bf/1fab8e9.jpg' }
    #       }]

    scenario 'displays each picture\'s name on main page' do
      visit '/pictures'
      expect(page).to have_content('photo')
      # expect(page).to have_selector("img[src$='https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/7/000/1ef/1bf/1fab8e9.jpg']")
      expect(page).not_to have_content('No pictures yet!')
    end

    scenario 'allows a user to add a specific picture and see it posted' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Name', with: 'photo2'
      click_button 'Create Picture'
      expect(page).to have_content 'photo2'
      expect(current_path).to eq '/pictures'
    end

    scenario 'allows a user to view a picture\'s own page by clicking on it' do
      visit '/pictures'
      click_link 'photo'
      expect(page).to have_content 'photo'
      expect(current_path).to eq "/pictures/#{photo.id}"
    end

    scenario 'allows a user to replace a picture by another' do
      visit '/pictures'
      click_link 'Edit photo'
      fill_in 'Name', with: 'newphoto'
      click_button 'Update Picture'
      expect(page).to have_content 'newphoto'
      expect(current_path).to eq '/pictures'
    end

    scenario 'allows a user to delete a picture' do
      visit '/pictures'
      click_link 'Delete photo'
      expect(page).not_to have_content 'photo'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end
end
