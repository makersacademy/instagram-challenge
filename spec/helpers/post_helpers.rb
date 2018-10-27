# frozen_string_literal: true

require 'rails_helper'

def create_post
  click_on 'New Post'
  fill_in 'post_description', with: "Cool pic"
  attach_file("post_image", Rails.root + "spec/support/xxx.jpeg")
  click_button 'Create Post'
end
