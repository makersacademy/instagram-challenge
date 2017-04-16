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
    Picture.create(title: 'Pic 1')
  end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Pic 1')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end  

  context 'creating pictures' do
    scenario 'prompts user to attach a picture, then displays the new picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'Pic 1'
      click_button 'Create Picture'
      expect(page).to have_content 'Pic 1'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do

  let!(:pic){Picture.create(title:'Pic 1')}

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'Pic 1'
      expect(page).to have_content 'Pic 1'
      expect(current_path).to eq "/pictures/#{pic.id}"
    end
  end

  context 'editing pictures' do

  before {Picture.create title: 'Pic 1'}

    scenario 'let a user edit a picture' do
      visit '/pictures'
      click_link 'Edit Pic 1'
      fill_in 'Title', with: 'Picture 1'
      click_button 'Update Picture'
      expect(page).to have_content 'Picture 1'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do

  before {Picture.create title: 'Pic 1'}

    scenario 'removes a picture when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Delete Pic 1'
      expect(page).not_to have_content 'Pic 1'
      expect(page).to have_content 'Picture deleted successfully'
    end

    scenario 'removes a comment associated with it' do
      visit '/pictures'
      click_link 'Comment Pic 1'
      fill_in "Thoughts", with: "so so"
      click_button 'Leave Comment'
      expect(current_path).to eq '/pictures'
      expect(page).to have_content('so so')
      click_link 'Delete Pic 1'
      expect(page).not_to have_content 'Pic 1'
      expect(page).not_to have_content 'so so'
    end
  end
end
