require 'rails_helper'

feature 'Liking photos' do
  before {Photo.create descr: 'Mount Fuji'}

  scenario "Each photo will be given default 'like' count of zero" do
    visit '/photos'
    expect(page).to have_content('0 likes')
  end

  scenario "User can like a photo, which updates the photo 'like' count", js: true do
    visit '/photos'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end