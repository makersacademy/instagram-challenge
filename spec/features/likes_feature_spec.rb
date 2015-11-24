require 'rails_helper'

feature 'liking images' do
  before do
    user = build(:user)
    sign_up(user)
    add_image
  end

  scenario 'a user can like an image, which increments the likes count', js: true do
    visit '/'
    click_link 'Like'
    expect(page).to have_content("1 likes")
  end
end
