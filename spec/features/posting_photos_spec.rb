require 'rails_helper'

feature 'photos' do
  context 'no photos added' do
    scenario 'no photos have been added' do
      visit '/'
      expect(page).to have_content 'no photos added'
      expect(page).to have_link 'Upload A Photo'
    end
  end
end

