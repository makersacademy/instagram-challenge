require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  context 'no images added yet' do

    scenario 'should show a link to add an image' do
      visit('/')
      expect(page).to have_content('No Images Added Yet')
      expect(page).to have_selector(:link_or_button, 'Upload Image')
    end
  end
end 
