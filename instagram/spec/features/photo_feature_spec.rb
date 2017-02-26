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
  context 'viewing photos' do
    let!(:cool){ Photo.create(comment:'cool') }
  scenario 'lets a user view a photo' do
     visit '/photos'
     click_link 'cool'
     expect(page).to have_content 'cool'
     expect(current_path).to eq "/photos/#{cool.id}"
    end
  end
  context 'deleting photos' do
    before { Photo.create(comment: 'cool')}
  scenario 'removes a photo when a user clicks a delete link' do
    visit '/photos'
    click_link 'Delete cool'
    expect(page).not_to have_content 'cool'
    expect(page).to have_content 'Photo deleted successfully'
  end

end

end
