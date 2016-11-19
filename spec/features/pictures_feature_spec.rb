require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'viewing pictures' do
    let!(:kitty){ Picture.create(description:'Kitty cat') }
    scenario 'lets a user view a picture' do
     visit '/pictures'
     click_link 'Kitty cat'
     expect(page).to have_content 'Kitty cat'
     expect(current_path).to eq "/pictures/#{kitty.id}"
    end
  end

  context 'editing pictures' do
    before { Picture.create(description: 'Kitty cat') }
    scenario 'let a user edit a picture' do
     visit '/pictures'
     click_link 'Kitty cat'
     click_link 'Edit'
     fill_in 'Description', with: 'Gorgeous cat cat'
     click_button 'Update'
     expect(page).to have_content 'Gorgeous cat cat'
     expect(page).not_to have_content 'Kitty cat'
     expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do
    before { Picture.create(description: 'Kitty cat') }
    scenario 'removes a picture when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Kitty cat'
      click_link 'Delete'
      expect(page).not_to have_content 'Kitty cat'
      expect(page).to have_content 'Picture deleted successfully'
      expect(current_path).to eq '/pictures'
    end
  end
end
