require 'rails_helper'

feature 'puns' do
  context 'no puns have been added' do
    scenario 'should display a prompt to add a pun' do
      visit '/puns'
      expect(page).to have_content 'No puns yet'
      expect(page).to have_link 'Add a pun'
    end
  end

  context 'puns have been added' do
    before do
      Pun.create(name: 'Pun1')
    end

    scenario 'display puns' do
      visit '/puns'
      expect(page).to have_content('Pun1')
      expect(page).not_to have_content('No puns yet')
    end
  end

  context 'creating puns' do
    scenario 'prompts user to fill out a form, then displays the new pun' do
      visit '/puns'
      click_link 'Add a pun'
      fill_in 'Name', with: 'Pun1'
      click_button 'Create Pun'
      expect(page).to have_content 'Pun1'
      expect(current_path).to eq '/puns'
    end
  end

  context 'viewing puns' do
    let!(:pun1) {Pun.create(name: 'Pun1') }
    scenario 'lets user view a pun' do
      visit '/puns'
      click_link 'Pun1'
      expect(page).to have_content 'Pun1'
    end
  end

  context 'editing puns' do
    before { Pun.create name: 'Pun1', description: 'Very funny', id: 1 }
    scenario 'let a user edit a pun' do
      visit '/puns'
      click_link 'Edit Pun1'
      fill_in 'Name', with: 'Pun for the weak'
      fill_in 'Description', with: 'Very funny'
      click_button 'Update Pun'
      click_link 'Pun for the weak'
      expect(page).to have_content 'Pun for the weak'
      expect(page).to have_content 'Very funny'
      expect(current_path).to eq '/puns/1'
    end
  end
end
