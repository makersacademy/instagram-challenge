require 'rails_helper'

feature 'liking photos' do
  before do
    photo = Photo.create(description: 'Cool pick')
  end

  scenario 'a user can like a photo, which updates the photo like count' do
    visit '/'
    click_link 'Like' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 Like')
  end

end
