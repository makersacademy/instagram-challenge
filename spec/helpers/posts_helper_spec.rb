require 'rails_helper'

module PostsHelper
  def create_post(title, description)
    visit '/posts'
    click_link 'Add a post'
    fill_fields(title, description)
    click_button 'Create Post'
  end

  def edit_post(title, description)
    visit '/posts'
    click_link 'Edit post'
    fill_fields(title, description)
    click_button 'Update Post'
  end

  def fill_fields(title, description)
    fill_in 'Title', with: title
    fill_in 'Description', with: description
  end
end