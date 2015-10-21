require 'rails_helper'

feature 'favouriting photos' do

  scenario 'a user can favourite a photo, which updates the photo favourite count', js: true do
    sign_up_with("test@example.com")
    user = User.first
    photo = Photo.create(caption: "test", image: File.new('./spec/assets/images/burger-king.png'), user: user)
    visit('/')
    find(".favourites-link").click
    expect(page).to have_content('1 Favourite')
  end

end