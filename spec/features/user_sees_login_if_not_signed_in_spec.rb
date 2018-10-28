# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Welcome page', type: :feature do
  scenario 'If not logged in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
