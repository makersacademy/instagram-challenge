require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No one has posted any photos yet...'
      expect(page).to have_link 'Post a photo'
    end
  end
  context 'photos have been added' do
    before do
      Photo.create(caption: 'My Lunch')
    end

    scenario 'display pictures' do
      visit '/photos'
      expect(page).to have_content('My Lunch')
      expect(page).not_to have_content 'No one has posted any photos yet...'
    end
  end
end
