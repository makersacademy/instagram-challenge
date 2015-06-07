require 'rails_helper'

module PostsHelper
  def create_post(title, description)
    click_link 'Add a pic'
    attach_file "Image",  Rails.root + "spec/asset_specs/rubber_duck.jpg"
    fill_fields(title, description)
    click_button 'Create Post'
  end

  def edit_post(title, description)
    find('.edit_post').click
    fill_fields(title, description)
    click_button 'Update Post'
  end

  def fill_fields(title, description)
    fill_in 'Title', with: title
    fill_in 'Description', with: description
  end

  def go_to_view_page(img_alt)
    find(:xpath, "//a/img[@alt='#{img_alt}']/..").click
  end
end