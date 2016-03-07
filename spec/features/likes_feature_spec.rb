require 'rails_helper'
require_relative 'web_spec_helper'

feature 'liking photos' do
    before { sign_up }
    before { add_photo }

  scenario 'a user can like a photo, which updates the likes count', js: true do
    visit '/photos'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end
