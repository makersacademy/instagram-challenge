require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been uploaded' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link "Add a picture"
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(title: "First Pic")
    end

    scenario 'displays pictures' do
      visit '/pictures'
      expect(page).to have_content "First Pic"
      expect(page).not_to have_content 'No pictures yet'
    end
  end

  context 'creating pictures' do
    scenario 'prompts user to fill out form' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'Test picture'
      click_button 'Create Picture'
      expect(page).to have_content 'Test picture'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    let!(:piccy){Picture.create(title:'Test picture')}

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'Test picture'
      expect(page).to have_content 'Test picture'
      expect(current_path).to eq "/pictures/#{piccy.id}"
    end
  end

  xcontext 'updating pictures' do
    before {Picture.create title: 'Test picture'}
    scenario 'let a user update a picture' do
      visit '/pictures'
      click_link "Edit Test picture"
      fill_in "Title", with: "Changed the title"
      click_button 'Update Picture'
      expect(page).to have_content 'Changed the title'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do
    before {Picture.create title: 'Test picture'}
    scenario '' do
      visit '/pictures'
      click_link 'Delete Test picture'
      expect(page).not_to have_content 'Test picture'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end


end