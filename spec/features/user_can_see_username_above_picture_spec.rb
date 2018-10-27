# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'U', type: :feature do
  scenario 'Can post a picture' do
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
end
