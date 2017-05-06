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

  context 'viewing adventures' do
    before do
      adventure = Travelgram.create(name: 'Bali')
    end

    scenario 'lets a user view an adventure' do
      visit '/travelgrams'
      click_link 'Bali'
      expect(page).to have_content 'Bali'
      expect(current_path).to eq "/travelgrams/#{Travelgram.last.id}"
    end
  end

  context 'editing adventures' do
    before do
      Travelgram.create(name: 'Bali', description: 'Breathtaking', id: 1)
    end

    scenario 'let a user edit an adventure' do
      visit '/travelgrams'
      click_link 'Edit Bali'
      fill_in 'Name', with: 'Bali trip'
      fill_in 'Description', with: 'Loved it'
      click_button 'Update adventure'
      click_link 'Bali trip'
      expect(page).to have_content 'Bali trip'
      expect(page).to have_content 'Loved it'
      expect(current_path).to eq '/travelgrams/1'
    end
  end

  context 'deleting adventures' do
    before do
      Travelgram.create(name: 'Bali', description: 'Breathtaking', id: 1)
    end

    scenario 'removes an adventure when a user clicks a delete link' do
      visit 'travelgrams'
      click_link 'Delete Bali'
      expect(page).not_to have_content 'Bali'
      expect(page).to have_content 'Adventure deleted successfully'
    end
  end
end