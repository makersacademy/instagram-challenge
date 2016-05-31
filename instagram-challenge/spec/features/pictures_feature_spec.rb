require 'rails_helper'

feature 'pictures' do
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end

  context 'adding a picture' do
    scenario 'prompt user to add a description for the picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Image', 'app/assets/images/anime1.jpeg'
      fill_in 'Description', with: 'New picture'
      click_button 'Create Picture'
      expect(page).to have_content 'New picture'
      expect(current_path).to eq '/pictures'
      expect(page).not_to have_content 'No pictures yet'
    end
  end
  context 'viewing the pictures' do
    let!(:anime) {Picture.create(description:'New picture')}
    scenario 'user can view a picture' do
      visit '/pictures'
      click_link 'New picture'
      expect(page).to have_content 'New picture'
      expect(current_path).to eq "/pictures/#{anime.id}"
    end
  end
  context 'deleting pictures' do
    scenario 'user can update the picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Image', 'app/assets/images/anime1.jpeg'
      fill_in 'Description', with: 'New picture'
      click_button 'Create Picture'
      click_link 'Delete New picture'
      expect(page).to_not have_content 'New picture'
      expect(current_path).to eq '/pictures'
    end
  end
 end
end
