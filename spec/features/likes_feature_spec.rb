require 'rails_helper'

feature 'liking photos' do
  before do
    sign_up
    upload_photo
  end

  scenario 'a user can like a photo, which updates the likes count' do
    visit '/photos'
    click_link 'A fun trip to the beach!'
    click_link "Like photo"
    expect(page).to have_content('1 like')
  end

end
