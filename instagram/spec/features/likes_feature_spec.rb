require 'rails_helper'

feature 'liking photos' do

  before do
    sign_up
    post_photo
  end

  scenario 'clicking like adds one like' do
    visit '/photos'
    click_link 'Like'
    visit '/photos'
    expect(page).to have_content('1 like')
  end
end
