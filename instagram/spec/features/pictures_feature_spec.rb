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
      sign_up
      upload_picture
      # expect(page).to have_css('img[src*="/system/pictures/images/000/000/001/thumb/rasp.jpg"]') WHAT IS THE BEST WAY TO TEST IF IMAGES ARE ON THE SCREEN?
      expect(page).to have_content('berries')
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    before {Picture.create description: 'berries'}

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'View picture'
      expect(page).to have_content 'berries'
    end
  end

  context 'editing descriptions' do
    before {Picture.create description: 'berries'}

    scenario 'let a user edit a picture description' do
    sign_up
    click_link 'Edit description'
    fill_in 'Description', with: 'berries from garden'
    click_button 'Update description'
    expect(page).to have_content 'berries from garden'
    expect(current_path).to eq '/pictures'
    end
  end

  context 'editing by authenticated users' do
    before {Picture.create description: 'berries'}

    scenario 'only logged-in users can edit/delete pictures' do
      visit '/pictures'
      click_link 'Delete picture'
      expect(current_path).to eq '/users/sign_in'
    end
  end

  context 'deletion of pictures' do
    scenario 'only the user which uploaded the picture can delete it' do
      sign_up
      upload_picture
      click_link 'Sign out'
      sign_up_different
      click_link 'Delete picture'
      expect(page).to have_content 'Only the original uploader can delete this photo'
    end

  end

end
