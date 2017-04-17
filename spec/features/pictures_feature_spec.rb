require 'rails_helper'

feature 'pictures' do
  context 'No pictures added' do
    scenario 'Display prompt to add picture' do
      visit '/pictures'
      expect(page).to have_content('No pictures yet')
      expect(page).to have_content('Add a picture')
    end
  end

  context 'Pictures added' do
    before do
      sign_up
      visit '/pictures'
      click_link 'Add a picture'
      attach_file "Image", "spec/asset_specs/photos/uku.jpg"
      click_button 'Create Picture'
    end

    scenario 'Displays pictures and timestamp' do
      visit '/pictures'
      expect(page).to have_selector('img')
      expect(page).not_to have_content('No pictures yet')
      expect(page).to have_content(Picture.all[0].created_at)
    end
  end

  context 'Adding pictures' do
    before  do
      sign_up
    end

    scenario 'form to fill in' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file "Image", 'spec/asset_specs/photos/uku.jpg'
      click_button 'Create Picture'
      expect(current_path).to eq '/pictures'
      expect(page).to have_selector('img')
    end
  end

  def sign_up
    visit '/'
    click_link 'Sign up'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end
end