require 'rails_helper'

def create_post
  visit '/posts'
  click_link 'Add a post'
  expect(current_path).to eq '/posts/new'
  fill_in 'Caption', with: "handsome chap"
  page.attach_file("post_image", Rails.root + 'app/assets/images/stick_man.jpg')
  click_button 'Create Post'
end
