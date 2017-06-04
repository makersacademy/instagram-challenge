require 'rails_helper'
require 'web_helpers'

RSpec.feature "Sessions", type: :feature do
  scenario "a user signs up", type: :feature do
    sign_up
    expect(page).to have_content("Welcome to Instasham.")
  end
end
