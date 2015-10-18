require 'rails_helper'

feature 'favouriting photos' do
  before(:each) do
    sign_up_with('test@example.com')
    post_photo('sunrise')
  end

  scenario 'a user can favourite a photo, which updates the photo favourite count', js: true do
    click_link 'Favourite'
    expect(page).to have_content('1 Favourite')
  end

end