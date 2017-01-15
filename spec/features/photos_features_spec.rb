require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photos' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(title: 'Test photo')
    end
    scenario 'display photo titles' do
      visit '/photos'
      expect(page).to have_content 'Test photo'
      expect(page).not_to have_content 'No photos yet'
    end
  end

  context 'creating photo posts' do
    scenario "prompts user to fill in a form, then displays photo's title" do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Title', with: 'Test photo'
      click_button 'Create Photo'
      expect(page).to have_content 'Test photo'
      expect(current_path).to eq '/photos'
    end
    context 'an invalid photo post' do
      scenario 'does not let you submit a title that is too short' do
        visit '/photos'
        click_link 'Add a photo'
        fill_in 'Title', with: 'Te'
        click_button 'Create Photo'
        expect(page).not_to have_css 'h3', text: 'Te'
        expect(page).to have_content 'error'
      end
    end
  end

  context 'viewing individual photo posts' do
    let!(:test_photo){ Photo.create(title: 'Test photo') }
    scenario 'lets a user view a photo post' do
      visit '/photos'
      click_link 'Test photo'
      expect(page).to have_content 'Test photo'
      expect(current_path).to eq "/photos/#{test_photo.id}"
    end
  end

  context 'editing photo posts' do
    before { Photo.create title: 'Test photo', description: 'This is a test', id: 1 }
    scenario 'let a user edit a photo post' do
      visit '/photos'
      click_link 'Edit Test photo'
      fill_in 'Title', with: 'No longer a test photo'
      fill_in 'Description', with: 'This is not a test'
      click_button 'Update Photo'
      click_link 'No longer a test photo'
      expect(page).to have_content 'No longer a test photo'
      expect(page).to have_content 'This is not a test'
      expect(current_path).to eq '/photos/1'
    end
  end

  context 'deleting photos' do
    before { Photo.create title: 'Test photo', description: 'This is a test' }
    scenario 'removes a photo when a user clicks a delete link' do
      visit '/photos'
      click_link 'Delete Test photo'
      expect(page).not_to have_content 'Test photo'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end

end
