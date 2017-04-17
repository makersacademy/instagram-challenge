require 'rails_helper'

feature 'Pictures' do

  before do
    signup(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest' )
  end

  context 'no pictures are added yet' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures are displayed' do
    before { Picture.create title: 'My picture' }

    scenario 'display picture' do
      visit '/pictures'
      expect(page).to have_content('My picture')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'add picture' do
    scenario 'prompts user to upload picture and give it a title, then displays the picture' do
      visit '/pictures'
      click_link 'Post a picture'
      fill_in 'Title', with: 'My Picture'
      click_button'Create Picture'
      expect(page).to have_content 'My Picture'
      expect(current_path).to eq '/pictures'
    end
  end


  context 'editing picture' do

    before { Picture.create title: 'My picture' }

    scenario 'let a user edit title and/or change picture' do
     visit '/pictures'
     click_link 'Edit'
     fill_in 'Title', with: 'My edited picture'
     click_button 'Update'
     expect(page).to have_content 'My edited picture'
     expect(current_path).to eq '/pictures'
    end

  end

  context 'deleting picture' do

    before {Picture.create title: 'My picture'}

    scenario 'removes a picture and all its related data' do
      visit '/pictures'
      click_link 'Delete'
      expect(page).not_to have_content 'My picture'
      expect(page).to have_content 'Picture deleted successfully'
    end

  end

end
