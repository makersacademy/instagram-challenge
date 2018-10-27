# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'Can sign up' do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
