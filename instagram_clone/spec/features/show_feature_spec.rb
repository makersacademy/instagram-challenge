require 'rails_helper'

feature 'show' do
  context 'When a user creates a photo' do
    scenario 'A user should be able to view their photos title and description' do
      sign_in
      create_a_photo
      expect(page).to have_content('testphoto')
      expect(page).to have_content('describedtest')
    end
  end
end
