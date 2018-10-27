# frozen_string_literal: true

require 'rails_helper'
require 'helpers/user_helpers.rb'
require 'helpers/post_helpers.rb'

RSpec.feature 'Edit Post', type: :feature do
  scenario 'Can update a post' do
    sign_up
    create_post
    click_on 'Edit Post'
    fill_in 'post_description', with: 'Very cool pic'
    click_button 'Update Post'
    expect(page).to have_content('Very cool pic')
  end

  scenario 'cannot update someone else post' do
    sign_up
    create_post
    click_on 'Logout'
    click_on 'Sign up'
    fill_in 'user_username', with: 'Dumbo'
    fill_in 'user_email', with: 'bye@world.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_on 'Sign up'
    expect(page).not_to have_selector(:link_or_button, 'Edit Post')
   end
end
