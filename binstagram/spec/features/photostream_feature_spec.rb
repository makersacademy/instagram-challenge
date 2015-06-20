require 'rails_helper'

feature 'photostream' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a new photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

#   context 'photos have been added' do

# end
  context 'adding photos' do
    scenario 'prompts user to attach file and fill out form, then displays photo' do
      visit '/photos'
      click_link 'Add a photo'
      attach_file 'Image', Rails.root.join('spec/features/dumpster.png')
      fill_in 'Name', with: 'Dumpster'
      fill_in 'Description', with: 'Industrial bin on wheels'
      click_button 'Submit photo'
      expect(page).to have_content 'Dumpster'
      expect(current_path). to eq '/photos'
    end
  end
end
