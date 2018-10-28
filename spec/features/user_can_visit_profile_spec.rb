# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Profile', type: :feature do
  scenario 'User can visit profile' do
    sign_up
    click_on 'Profile'
    expect(page).to have_content('Casper')
  end

  scenario 'User can see their post in profile page' do
    sign_up
    create_post
    click_on 'Profile'
    expect(page).to have_content('Cool pic')
  end

  scenario 'User can return to homepage from profile' do
    sign_up
    click_on 'Profile'
    click_on 'Homepage'
    expect(current_path).to eq(welcome_index_path)
  end
end
