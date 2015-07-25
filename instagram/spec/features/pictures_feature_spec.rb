#query about locating photo on page
require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(description: 'raspberries')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content 'raspberries'
      expect(page).not_to have_content('No photos yet')
    end
  end


  context 'creating new pictures' do
    scenario 'user prompted to fill out form, upload picture, which displays new picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Image','spec/features/rasp.jpg'
      fill_in 'Description', with: 'berries'
      click_button 'Upload picture'
      # expect(page).to have_css('img[src*="/system/pictures/images/000/000/001/thumb/rasp.jpg"]') WHAT IS THE BEST WAY TO TEST IF IMAGES ARE ON THE SCREEN?
      expect(page).to have_content('berries')
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    let!(:berries){Picture.create(description:'berries')}

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'View picture'
      expect(page).to have_content 'berries'
      expect(current_path).to eq "/pictures/#{berries.id}"
    end
  end

  context 'editing pictures' do
    before {Picture.create description: 'berries'}

    scenario 'let a user edit a picture' do
    visit '/pictures'
    click_link 'Edit Description'
    fill_in 'Description', with: 'berries from garden'
    click_button 'Update Picture'
    expect(page).to have_content 'berries from garden'
    expect(current_path).to eq '/pictures'
    end
  end

end
