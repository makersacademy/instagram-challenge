require 'rails_helper'

feature 'instagram' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Show everyone how great your life is'
    end
  end
end
