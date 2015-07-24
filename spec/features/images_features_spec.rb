require 'rails_helper'

feature 'Images' do

  context 'none have been uploaded' do
    scenario 'should let the user know there are no images' do
      visit '/images'
      expect(page).to have_content 'No images yet'
    end

  end

end
