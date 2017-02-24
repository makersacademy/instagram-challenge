require 'rails_helper'

feature 'FEATURE: Images' do

  context 'no images have been added' do
    scenario 'should display a message saying no images have been added yet' do
      visit '/images'
      expect(page). to have_content 'No images have been added yet!'
    end
  end

end
