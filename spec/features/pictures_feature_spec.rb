require 'rails_helper'

feature 'Pictures' do

  context 'no pictures are added yet' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures are displayed' do
    before do
      Picture.create(title: 'My picture')
    end
    scenario 'display picture' do
      visit '/pictures'
      expect(page).to have_content('My picture')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'add title to a  picture' do
    scenario 'prompts user to fill title, then displays the picture title' do
      visit '/pictures'
      click_link 'Post a picture'
      fill_in 'Title', with: 'My Picture'
      click_button'Create Picture'
      expect(page).to have_content 'My Picture'
      expect(current_path).to eq '/pictures'
    end
  end


  context 'editing picture title' do

    before { Picture.create title: 'My picture' }

    scenario 'let a user edit title' do
     visit '/pictures'
     click_link 'Edit'
     fill_in 'Title', with: 'My edited picture'
     click_button 'Update'
     expect(page).to have_content 'My edited picture'
     expect(current_path).to eq '/pictures'
    end

  end


end
