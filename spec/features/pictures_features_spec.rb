require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should diplay a prompt to upload a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures posted'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(description: 'description')
    end

    scenario 'display pictures' do
      visit pictures_path
      expect(page).to have_content('description')
      expect(page).not_to have_content('No pictures posted')
    end
  end

  context 'creating picture posts' do
    scenario 'prompts user to fill out a form, then displays the new picture post' do
      visit pictures_path
      click_link 'Post a picture'
      fill_in 'Description', with: 'description'
      click_button 'Create Picture'
      expect(page).to have_content 'description'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting picture posts' do

  before { Picture.create description: 'description' }

    scenario 'removes a picture when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Delete description'
      expect(page).not_to have_content 'description'
      # expect(page).to have_content 'Restaurant deleted successfully'
    end
  end

end
