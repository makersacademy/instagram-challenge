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
end
