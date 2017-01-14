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


end
