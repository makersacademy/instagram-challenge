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
end
