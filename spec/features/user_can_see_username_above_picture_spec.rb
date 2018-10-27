# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'U', type: :feature do
  scenario 'Can post a picture' do
    sign_up
    create_post
    expect(page).to have_content('Post was successfully created.')
  end
end
