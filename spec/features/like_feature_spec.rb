require 'rails_helper'
require 'web_helper'

feature 'like image' do
  before do
    sign_up
    create_new_image
  end

  it 'a user can like an image, which increments the like count', js: true do
    visit '/images'
    click_link 'Like'
    expect(page).to have_content("1 likes")
  end

end
