# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Post', type: :feature do
  scenario 'Can create a post' do
    visit '/'
    click_on 'Sign up'
    fill_in 'user_username', with: 'Casper'
    fill_in 'user_email', with: 'hello@world.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    click_on 'New Post'
    fill_in 'post_description', with: "Cool pic"
    attach_file("post_image", Rails.root + "spec/support/xxx.jpeg")
    click_button 'Create Post'
    expect(page).to have_content('Post was successfully created.')
  end

  scenario 'Can delete a post' do
    visit '/'
    click_on 'Sign up'
    fill_in 'user_username', with: 'Casper'
    fill_in 'user_email', with: 'hello@world.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    click_on 'New Post'
    fill_in 'post_description', with: "Cool pic"
    attach_file("post_image", Rails.root + "spec/support/xxx.jpeg")
    click_button 'Create Post'
    click_on 'Delete'
    expect(page).to_not have_content('Cool pic')
  end

  scenario 'Can update a post' do
    visit '/'
    click_on 'Sign up'
    fill_in 'user_username', with: 'Casper'
    fill_in 'user_email', with: 'hello@world.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    click_on 'New Post'
    fill_in 'post_description', with: "Cool pic"
    attach_file("post_image", Rails.root + "spec/support/xxx.jpeg")
    click_button 'Create Post'
    click_on 'Edit'
    fill_in 'post_description', with: 'Very cool pic'
    click_button 'Update Post'
    expect(page).to have_content('Very cool pic')
  end

  scenario 'can see username above picture' do
    visit '/'
    sign_up
    click_on 'New Post'
    fill_in 'post_description', with: "Cool pic"
    attach_file("post_image", Rails.root + "spec/support/xxx.jpeg")
    click_button 'Create Post'
    expect(page.find_by_id('post_1')).to have_content('Casper')
  end
end
