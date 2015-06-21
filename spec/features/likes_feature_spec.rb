require 'rails_helper'
require_relative '../helpers/session_helpers.rb'

include Session

feature 'Liking photos' do
  before {Photo.create descr: 'Mount Fuji'}

  scenario "Each photo will be given default 'like' count of zero" do
    visit '/photos'
    expect(page).to have_content '0 likes'
  end

  context 'Signed in' do
    before {sign_up('test@example.com', 'password')}
    scenario "User can like a photo, which updates the photo 'like' count", js: true do
      click_link 'Like'
      expect(page).to have_content '1 like'
      expect(page).not_to have_content '0 likes'
    end
  end

  context 'Not signed in' do
    scenario "Does not allow users to like a photo", js: true do
      visit '/photos'
      click_link 'Like'
      expect(page).to have_content '0 likes'
      expect(page).not_to have_content '1 like'
    end
  end

end