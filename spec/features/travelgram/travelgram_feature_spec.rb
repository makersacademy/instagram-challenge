require 'rails_helper'

feature 'travelgram' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/travelgram'
      expect(page).to have_content 'Start posting!'
      expect(page).to have_link 'Share Adventure'
    end
  end

  context 'Adventures have been added' do
    before do
      Adventure.create(name: 'Bali trip')
    end

    scenario 'Display adventures' do
      visit 'travelgram'
      expect(page).to have_content('Bali trip')
      expect(page).not_to have_content('Start posting!')
    end
  end
end