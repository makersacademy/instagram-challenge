require 'rails_helper'

feature 'photos' do
  xcontext 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end
end

context 'photos have been added' do
  before do
    Photo.create(title: 'Test Photo')
  end

  scenario 'display photos' do
    visit '/photos'
    expect(page).to have_content('Test Photo')
    expect(page).not_to have_content('No photos yet!')
  end

  xcontext 'creating photos' do
  scenario 'prompts user to fill out a form, then displays the new photo' do
    visit '/photos'
    click_link 'Add a photo'
    fill_in 'title', with: 'Test Photo'
    click_button 'Create Photo'
    expect(page).to have_content 'Test Photo'
    expect(current_path).to eq '/photos'
  end
end
end
