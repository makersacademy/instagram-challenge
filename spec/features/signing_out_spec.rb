require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Signing out', type: :feature do
  scenario do
    sign_up_user
    sign_in_user
    click_link 'Sign Out'
    expect(page).to have_content('You have signed out')
    expect(current_path).to eq('/')
  end
end
