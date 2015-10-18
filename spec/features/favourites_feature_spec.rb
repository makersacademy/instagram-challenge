require 'rails_helper'

feature 'favouriting photos' do
  before do
    sunrise = Photo.create(caption: 'sunrise')
  end

  scenario 'a user can favourite a photo, which updates the photo favourite count', js: true do
    visit '/photos'
    click_link 'Favourite' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 Favourite')
  end

end