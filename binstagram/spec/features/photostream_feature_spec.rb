require 'rails_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'photostream' do
  
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testpassword')
    fill_in('Password confirmation', with: 'testpassword')
    click_button('Sign up')
  end

  context 'no photos have been added' do
    scenario 'should display a prompt to add a new photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      add_photo('Dumpster', 'Industrial bin in blue with 4 multi-directional wheels.')
    end
    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('Dumpster')
      expect(page).not_to have_content('no photos yet')
    end
  end

  context 'adding photos' do
    scenario 'prompts user to attach file and fill out form, then displays photo' do
      visit '/photos'
      click_link 'Add a photo'
      attach_file 'Image', Rails.root.join('spec/features/dumpster.png')
      fill_in 'Name', with: 'Dumpster'
      fill_in 'Description', with: 'Industrial bin on wheels'
      click_button 'Create Photo'
      expect(page).to have_content 'Dumpster'
      expect(current_path). to eq '/photos'
      expect(page).to have_css('img[src*="/system/photos/images/000/000/002/medium/dumpster.png"]')
    end

    context 'an invalid submission' do
      it 'does not let you submit a photo without choosing a file' do
        add_photo('Dumpster', 'Industrial bin in blue with 4 multi-directional wheels.')
        expect(page).not_to have_content 'No file chosen'
      end
    end
  end

end
