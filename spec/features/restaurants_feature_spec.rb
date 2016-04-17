require 'rails_helper'

feature 'Images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit images_path
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end
end
