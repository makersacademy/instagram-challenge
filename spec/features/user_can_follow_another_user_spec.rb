# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Follow', type: :feature do
  scenario 'Can follow another user' do
    sign_up
    create_post
    click_on 'Logout'
    click_on 'Sign up'
    sign_up2
    click_on 'Casper'
    click_on 'Follow'
    user = User.find_by(username: 'Casper')
    expect(user.followers.count).to eq(1)
  end

  xscenario 'Can unfollow another user' do
    sign_up
    create_post
    click_on 'Logout'
    click_on 'Sign up'
    sign_up2
    click_on 'Casper'
    click_on 'Follow'
    click_on 'Unfollow'
    user = User.find_by(username: 'Casper')
    expect(user.followers.count).to eq(0)
  end
end
