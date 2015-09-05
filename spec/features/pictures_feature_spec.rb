require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(image: 'Kitten', description: 'kittens!')
    end

    scenario 'displays image' do
      visit '/pictures'
      expect(page).to have_content('Kitten')
      expect(page).not_to have_content('No pictures yet')
    end

    scenario 'displays description' do
      visit '/pictures'
      expect(page).to have_content('kittens!')
    end

  end

  context 'adding pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Image', with: 'Kitten'
      fill_in 'Description', with: 'kittens!'
      click_button 'Create Picture'
      expect(page).to have_content 'Kitten'
      expect(current_path).to eq '/pictures'
    end
  end
end