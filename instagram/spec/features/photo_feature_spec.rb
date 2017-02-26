require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end
  context 'photos have been added' do
    before do
    Photo.create(comment: 'cool stuff')
  end
    scenario 'display photos' do
    visit '/photos'
    expect(page).to have_content('cool stuff')
    expect(page).not_to have_content('No photos yet')
  end
end
  context 'creating photos' do
  scenario 'prompts user to add photo and comment, then displays the new photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Comment', with: 'cool stuff'
      click_button 'Create Photo'
      expect(page).to have_content 'cool stuff'
      expect(current_path).to eq '/photos'
    end
  end

end
