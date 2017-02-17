require 'rails_helper'

feature 'liking photos' do

  before do
    sign_up
    post_photo
  end

  scenario 'clicking like adds one like', js: true do
    visit '/photos'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end
