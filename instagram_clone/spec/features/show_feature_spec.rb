require 'rails_helper'

feature 'show' do
  context 'When a user creates a photo' do
    scenario 'A user should be able to view their photos title and description' do
      create_a_photo
      expect(page).to have_content('testpin')
      expect(page).to have_content('describedtest')
    end
  end
end
