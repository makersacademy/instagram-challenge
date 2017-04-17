require 'rails_helper'

feature 'liking pictures' do

  scenario 'a user can like a picture, which updates the likes count', js: true do
    visit '/'
    user = build :user
    sign_up(user)
    click_link 'Add a picture'
    fill_in 'Title', with: 'Holiday'
    attach_file "picture_image", "spec/fixtures/image3.png"
    click_button 'Create Picture'
    click_link 'Like'
    expect(page).to have_content('1 Like')
  end

end
