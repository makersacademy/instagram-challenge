# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Upload', type: :feature do
  scenario 'Can upload photos and view them' do
    signup
    upload_image
    expect(page).to have_content('Easy Peasy')
  end
end
