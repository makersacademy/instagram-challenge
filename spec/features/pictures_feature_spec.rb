require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to upload a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_content 'Upload picture'
    end
  end

  context 'pictures have been added' do
    scenario 'displays pictures' do
      visit '/pictures'
      click_link 'Upload picture'
      expect(current_path).to eq '/pictures/new'
      attach_file 'Picture', Rails.root.join('spec/images/sanj.jpeg')
      fill_in 'Description', with: 'Sanjay!'
      click_button 'Upload picture'
      expect(current_path).to eq '/pictures'
      expect(page).not_to have_content 'No pictures yet'
      expect(page).to have_css 'img.uploaded-pic'
      expect(page).to have_content 'Sanjay!'
    end
  end

  context 'viewing pictures' do

    let!(:arches) { Picture.create(description: "Arches") }

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link "#{arches.description}"
      expect(current_path).to eq "/pictures/#{arches.id}"
      expect(page).to have_content "Edit"
    end
  end

  context 'editing pictures' do

    let!(:arches) { Picture.create(description: "Arches") }

    scenario 'lets a user edit a description' do
      visit '/pictures'
      click_link "#{arches.description}"
      click_link "Edit"
      fill_in 'Description', with: 'Arches National Park'
      click_button 'Update'
      expect(current_path).to eq '/pictures'
      expect(page).to have_content 'Arches National Park'
    end

    scenario 'lets a user delete a picture' do
      visit '/pictures'
      click_link "#{arches.description}"
      click_link "Delete"
      expect(page).not_to have_content 'Arches'
      expect(page).to have_content 'Picture deleted successfully'
    end

  end
end
