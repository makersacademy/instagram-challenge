# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Upload image', type: :feature do
  scenario 'User can post their images' do
    log_in
    upload_image
    expect(page).to have_content('test post')
  end
end
