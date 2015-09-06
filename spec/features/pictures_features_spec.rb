require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add A Picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(name: 'Holiday')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Holiday')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'adding pictures' do
    scenario 'prompts user to fill out a name for picture, then displays the name' do
      visit '/pictures'
      click_link 'Add A Picture'
      fill_in 'Name', with: 'Holiday'
      click_button 'Create Picture'
      expect(page).to have_content 'Holiday'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do

    let!(:holiday){Picture.create(name:'Holiday')}

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'Holiday'
      expect(page).to have_content 'Holiday'
      expect(current_path).to eq "/pictures/#{holiday.id}"
    end
  end

  context 'editing picture titles' do

    before {Picture.create name: 'Holiday'}

    scenario 'let a user edit a pictures name' do
      visit '/pictures'
      click_link 'Edit Holiday'
      fill_in 'Name', with: 'Vacation'
      click_button 'Update Picture'
      expect(page).to have_content 'Vacation'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do

    before {Picture.create name: 'Holiday'}

    scenario 'removes a picture when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Delete Holiday'
      expect(page).not_to have_content 'Holiday'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end
end