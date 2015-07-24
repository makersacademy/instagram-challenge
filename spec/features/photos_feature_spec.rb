require 'rails_helper'

feature 'Photos' do
  context 'with no uploaded photos' do

    it 'A user can view the homepage' do
      visit '/'
      expect(page).to have_content 'No photos yet'
      expect(current_path).to eq photos_path
    end

    it 'A user can upload a photo' do
      visit '/'
      click_link 'Upload photo'

    end

end
end
