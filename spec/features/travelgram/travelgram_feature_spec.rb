require 'rails_helper'

feature 'travelgram' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/travelgrams'
      expect(page).to have_content 'Start posting!'
      expect(page).to have_link 'Share Adventure'
    end
  end

  context 'adventures have been added' do
    before do
      Travelgram.create(name: 'Bali trip')
    end

    scenario 'Display adventures' do
      visit '/travelgrams'
      expect(page).to have_content('Bali trip')
      expect(page).not_to have_content('Start posting!')
    end
  end

  context 'creating adventures' do
    scenario 'prompts user to fill out a form, then displays new adventure' do
      visit '/travelgrams'
      click_link 'Share Adventure'
      fill_in 'Name', with: 'Bali trip'
      click_button 'Share'
      expect(page).to have_content 'Bali trip'
      expect(current_path).to eq '/travelgrams'
    end
  end
end