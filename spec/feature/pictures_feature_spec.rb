require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'adding pictures' do
    scenario 'prompts the user with a form to add pictures' do
      visit '/pictures'
      add_a_picture
      expect(page).to have_content 'My picture'
      expect(page).not_to have_content 'No pictures yet'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(name: 'My picture', description: 'This is a fantastic pic')
    end
    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content 'My picture'
      expect(page).not_to have_content 'No pictures yet'
    end
  end

  context 'viewing pictures' do

    let!(:my_picture){ Picture.create(name:'My picture', description: 'This is a fantastic pic') }

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'My picture'
      expect(page).to have_content 'My picture'
      expect(current_path).to eq "/pictures/#{my_picture.id}"
    end

  end

  context 'editing pictures' do

    before { Picture.create name: 'My picture', description: 'This is a fantastic pic' }

    scenario 'let a user edit a picture' do
      visit '/pictures'
      click_link 'Edit My picture'
      fill_in 'Name', with: 'My picture'
      fill_in 'Description', with: 'Even better description'
      click_button 'Update Picture'
      expect(page).to have_content 'My picture'
      expect(page).to have_content 'Even better description'
      expect(current_path).to eq '/pictures'
    end

  end

  context 'deleting pictures' do

    before { Picture.create name: 'My picture', description: 'This is a fantastic pic' }

    scenario 'removes a picture when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Delete My picture'
      expect(page).not_to have_content 'My picture'
      expect(page).to have_content 'Picture deleted successfully'
    end

  end

end

def add_a_picture
  click_link 'Add a picture'
  fill_in 'Name', with: 'My picture'
  fill_in 'Description', with: 'This is a fantastic pic'
  click_button 'Create Picture'
end
