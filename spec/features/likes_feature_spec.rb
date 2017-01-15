require 'rails_helper'

feature 'liking a photo' do

  before do
    sign_up
    add_photo
    click_photo
  end

  scenario 'a user can like a photo, and updates the like count' do
    click_link 'Like'
    expect(page).to have_content('1 Like')
  end

end
