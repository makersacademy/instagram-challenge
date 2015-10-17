require 'rails_helper'

feature 'liking images' do
  before do
    user = build(:user)
    sign_up(user)
  end

  scenario 'a user can like an image, which increments the likes count', js: true do
    click_link "Add an image"
    fill_in id="image_name", with: 'Missing'
    attach_file(id="image_image", Rails.root + 'public/images/thumb/missing.png')
    click_button 'Create Image'
    click_link 'Like'
    expect(page).to have_content("1 like")
  end
end
