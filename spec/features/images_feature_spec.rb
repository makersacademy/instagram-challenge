require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'Welcome to Instagram'
      expect(page).to have_link 'Add your image here!'
    end
  end

end
