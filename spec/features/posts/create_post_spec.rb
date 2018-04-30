require 'rails_helper'
require 'feature_helper'

feature 'Creating posts' do
  scenario 'can create a post with an image' do
    sign_up
    create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
    expect(page).to have_content('A lovely castle')
    expect(page).to have_css("img[src*='castle.jpg']")
  end

  scenario 'cannot create a post without image' do
    sign_up
    visit '/'
    click_link 'New Post'
    fill_in 'post-desc', with: 'A lovely castle'
    click_button 'Create Post'
    expect(page).to have_content("Image can't be blank")
  end
end