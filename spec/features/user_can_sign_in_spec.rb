# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  scenario 'Can sign in' do
    sign_up
    click_on 'Logout'
    log_in
    expect(page).to have_content('Signed in successfully.')
  end
end
