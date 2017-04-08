require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a button to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a photo'
    end
  end

  context 'photos have been added' do
  before do
    Photo.create(caption: "It's sunny!")
  end

  scenario 'display photos' do
    visit '/photos'
    expect(page).to have_content("It's sunny!")
    expect(page).not_to have_content('No photos yet')
  end
end
end
