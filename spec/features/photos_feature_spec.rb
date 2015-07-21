require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should show an upload button' do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@test.es')
      fill_in('Password', with: 'pAssw0rd')
      fill_in('Password confirmation', with: 'pAssw0rd')
      click_button('Sign up')
      expect(page).to have_content 'no photos!'
      expect(page).to have_button 'Upload a photo'
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
      click_link('Sign up')
      fill_in('Email', with: 'test@test.es')
      fill_in('Password', with: 'pAssw0rd')
      fill_in('Password confirmation', with: 'pAssw0rd')
      click_button('Sign up')
      click_button 'Upload a photo'
      fill_in 'Caption', with: 'a lion'
      attach_file 'Image', 'spec/features/lion.jpg'
      click_button 'Create photo'
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'a lion'
      expect(page).to have_selector 'img'
    end

    scenario 'does not allow posting of photos unless logged in' do
      visit '/photos'
      expect(page).not_to have_button 'Upload a photo'
    end
  end
end