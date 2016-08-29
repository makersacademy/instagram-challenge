require 'rails_helper'

feature 'images' do

  context 'no images have been added' do

    scenario 'there should be a link to add images' do
      visit '/images'
      expect(page).to have_link 'Add An Image'
    end

  end

  context 'images have been added' do

    before do
      Image.create(name: 'Holiday pic')
    end

    scenario 'displaying images' do
      visit '/images'
      expect(page).to have_content('Holiday pic')
    end

  end

  context 'adding images' do

    scenario 'provides a form for adding images' do
      sign_up
      click_link 'Add An Image'
      fill_in 'Name', with: 'Holiday pic'
      click_button 'Upload Image'
      expect(current_path).to eq '/images'
      expect(page).to have_content 'Holiday pic'
    end

  end

  context 'viewing images' do

    let!(:holidaypic){ Image.create(name: 'Holiday pic')}

    scenario 'an image can be viewed individually' do
      visit '/images'
      click_link 'Holiday pic'
      expect(page).to have_content 'Holiday pic'
      expect(current_path).to eq "/images/#{holidaypic.id}"
    end

  end

  context 'updating an image' do

    scenario 'allows a user to edit an image' do
      sign_up
      add_image
      click_link 'Edit Holiday pic'
      fill_in 'Name', with: 'Italy in the summer'
      click_button 'Update Image'
      expect(current_path).to eq '/images'
      expect(page).not_to have_content 'Holiday pic'
      expect(page).to have_content 'Italy in the summer'
    end

  end

  context 'deleting an image' do

    scenario 'deletes an image when the user clicks a link' do
      sign_up
      add_image
      click_link 'Holiday pic'
      click_link 'Delete Holiday pic'
      expect(current_path).to eq '/images'
      expect(page).not_to have_content 'Holiday pic'
      expect(page).to have_content 'Image has been deleted'
    end

  end
end
