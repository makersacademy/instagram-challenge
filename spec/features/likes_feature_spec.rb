require 'rails_helper'
include UsersHelper
include PhotosHelper

feature 'likes' do
  before {  user = build :user
            sign_up user
            create_photo }

  scenario 'a user can like a photo, which updates the like count' do
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
