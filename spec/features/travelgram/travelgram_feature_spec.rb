require 'rails_helper'

feature 'travelgram' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/travelgram'
      expect(page).to have_content 'Start posting!'
      expect(page).to have_link 'Share Adventure'
    end
  end
end