# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Follow', type: :feature do
  scenario 'Can follow another user' do
    sign_up
    create_post
    click_on 'Logout'
    click_on 'Sign up'
    fill_in 'user_username', with: 'Dumbo'
    fill_in 'user_email', with: 'bye@world.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_on 'Sign up'
    click_on 'Casper'
    click_on 'Follow'
    user = User.find_by(username: 'Casper')
    expect(user.followers.count).to eq(1)
  end
end
