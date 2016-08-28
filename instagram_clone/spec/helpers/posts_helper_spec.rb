require 'rails_helper'

def create_post(caption: "handsome chap")
  visit '/posts'
  click_button 'Add a post'
  expect(current_path).to eq '/posts/new'
  fill_in 'Caption', with: caption
  page.attach_file("post_image", Rails.root + 'app/assets/images/stick_man.jpg')
  click_button 'Create Post'
end
