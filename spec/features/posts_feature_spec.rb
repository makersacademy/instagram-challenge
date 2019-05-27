require 'rails_helper'
require 'web_helper'


feature 'Users can upload a post' do
  scenario 'user uploads a new picture' do
    create_new_user
    visit '/posts'
    visit new_post_path
    page.attach_file("post_image", Rails.root + 'spec/fixtures/Cookies.jpg')
    fill_in 'Caption', with: 'Caption'
    click_button('Create Post')
    expect(page).to have_content("Caption")
  end
end
