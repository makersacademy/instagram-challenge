require 'rails_helper'

feature 'liking photos' do
  before(:each) do
    user = build :user
    sign_up(user)
    upload_photo
  end

  xit 'a user can like a photo, which increments the like count', js: true do
    visit '/photos'
    click_on 'like'
    expect(page).to have_content("1 like")
  end
end