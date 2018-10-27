# frozen_string_literal: true

require 'rails_helper'
require 'helpers/user_helpers.rb'
require 'helpers/post_helpers.rb'

RSpec.feature 'Delete Post', type: :feature do
  scenario 'Can delete a post' do
    sign_up
    create_post
    click_on 'Delete'
    expect(page).to_not have_content('Cool pic')
  end
end
