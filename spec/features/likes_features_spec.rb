require 'rails_helper'

feature 'liking photos' do

  let(:user3){ build :user3 }

  scenario 'a user can like a photo, which updates the likes count', js: true do
    visit '/photos'
    sign_up(user3)
    add_photo
    click_link '♡'
    expect(page).to have_content '♥ 1 likes'
  end

  scenario 'a user cannot like the same photo twice', js: true do
    visit '/photos'
    sign_up(user3)
    add_photo
    click_link '♡'
    click_link '♡'
    expect(page).to have_content '♥ 1 likes'
  end

end
