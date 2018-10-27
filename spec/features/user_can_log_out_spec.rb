# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Log out', type: :feature do
  scenario 'Can Log out' do
    sign_up
    click_on 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
end
