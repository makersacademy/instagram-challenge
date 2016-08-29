require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/photos'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'image title have been added' do
    before do
      Photo.create(title: 'Sunflowers')
    end

    scenario 'display photos' do
      sign_up
      visit '/photos'
      expect(page).to have_content('Sunflowers')
      expect(page).not_to have_content('No images yet')
    end
  end
end
