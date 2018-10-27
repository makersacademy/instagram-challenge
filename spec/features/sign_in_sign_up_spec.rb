# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can visit website and Sign up' do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
