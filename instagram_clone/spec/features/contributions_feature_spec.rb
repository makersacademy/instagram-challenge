require 'rails_helper'

feature 'contributions' do
  context 'no contributions have been added' do
    scenario 'should display a prompt to add a contribution' do
      visit '/contributions'
      expect(page).to have_content 'No contributions yet'
      expect(page).to have_link 'Add a contribution'
    end
  end

  context 'contributions have been added' do
    before do
      Contribution.create(comment: 'A black cat')
      # image: '/Users/asukaochi/Downloads/IMG_20161220_101030.jpg',
    end

    scenario 'display contributions' do
      visit '/contributions'
      expect(page).to have_content 'A black cat'
    end
  end

  context 'creating contributions' do
    scenario 'prompts user to fill out a form, then displays the new contribution' do
      visit '/contributions'
      click_link 'Add a contribution'
      fill_in 'Comment', with: 'A black cat'
      click_button 'Create Contribution'
      expect(page).to have_content 'A black cat'
      expect(current_path).to eq '/contributions'
    end
  end
end
