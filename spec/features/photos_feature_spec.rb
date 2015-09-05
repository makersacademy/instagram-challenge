require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display message "no photos on your feed"' do
      visit '/photos'
      expect(page).to have_content 'no photos on your feed'
    end
  end
end