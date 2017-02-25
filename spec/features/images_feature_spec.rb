require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/restaurants'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add am image'
    end
  end

  context 'restaurants have been added' do
    before do
      Images.create()
    end

    scenario 'display images' do
      visit '/images'
      expect(page).not_to have_content('No images yet')
    end
  end

end
