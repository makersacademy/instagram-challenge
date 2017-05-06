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
      create_picture
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Me')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Name', with: 'Me'
      fill_in 'Description', with: 'A picture of me'
      click_button 'Upload picture'
      expect(page).to have_content 'Me'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    scenario 'lets a user view a picture' do
      create_picture
      click_link 'Me'
      expect(page).to have_content 'A picture of me'
      expect(current_path).to eq "/pictures/#{Picture.last.id}"
    end
  end

  context 'editing pictures' do
    scenario 'let a user edit a pictures description' do
      create_picture
      visit root_path
      click_link 'Me'
      click_link 'Edit Me'
      fill_in 'Description', with: 'A great selfie'
      click_button 'Update post'

      click_link 'Me'
      expect(page).to have_content 'A great selfie'
      expect(page).not_to have_content 'A picture of me'
      expect(current_path).to eq "/pictures/#{Picture.last.id}"
    end
  end

  context 'deleting pictures' do
    before do
      create_picture
    end

    scenario 'removes a picture when user clicks delete link' do
      visit root_path
      click_link 'Delete Me'
      expect(page).not_to have_content 'Me'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end
end
