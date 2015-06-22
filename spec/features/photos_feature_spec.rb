require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should show an upload button' do
      visit '/photos'
      expect(page).to have_content 'no photos!'
      expect(page).to have_button 'Upload your photo'
    end
  end

  # context 'photos have been added' do
  #   before do

  #    end

  #   scenario 'should display caption' do
  #     visit '/photos'
  #     expect(page).to have_content('what a picture - what a photograph!')
  #     expect(page).not_to have_content('No photos yet')
  #   end
  # end

  context 'creating photos' do
    scenario 'gives user a form to add photo, displays caption' do
      visit '/photos'
      click_button 'Upload your photo'
      fill_in 'Caption', with: 'a lion'
      attach_file 'Image', 'spec/features/lion.jpg'
      click_button 'Create photo'
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'a lion'
      expect(page).to have_selector 'img'
    end
  end
end