# frozen_string_literal: true

require 'rails_helper'
require 'helpers/user_helpers.rb'
require 'helpers/post_helpers.rb'

RSpec.feature 'Post', type: :feature do
  scenario 'Can create a post' do
    sign_up
    click_on 'New Post'
    fill_in 'post_description', with: "Cool pic"
    attach_file("post_image", Rails.root + "spec/support/xxx.jpeg")
    click_button 'Create Post'
    expect(page).to have_content('Post was successfully created.')
  end

  scenario 'Can delete a post' do
    sign_up
    create_post
    click_on 'Delete'
    expect(page).to_not have_content('Cool pic')
  end

  scenario 'Can update a post' do
    sign_up
    create_post
    click_on 'Edit'
    fill_in 'post_description', with: 'Very cool pic'
    click_button 'Update Post'
    expect(page).to have_content('Very cool pic')
  end

  scenario 'can see username above picture' do
    visit '/'
    sign_up
    create_post
    expect(page.find_by_id('post_1')).to have_content('Casper')
  end
end
