require 'rails_helper'

feature 'photos' do 
  context 'no photos have been added' do
    scenario 'should have no photos yet' do
      visit '/'
      expect(page).to have_content 'No photos yet'
    end
  end 
end