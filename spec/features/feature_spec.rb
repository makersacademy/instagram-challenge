require 'rails_helper'

feature 'feed' do
  scenario 'display the welcome message' do
    visit '/'
    expect(page).to have_content('Welcome to Filterspam!')
  end

  context 'no filterspams have been posted' do
    scenario 'display prompt to add filterspam' do
      visit '/'
      expect(page).to have_content('No filterspams :(')
      expect(page).to have_link('Add filterspam')
    end
  end

end
