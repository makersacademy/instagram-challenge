require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature "Registration", type: :feature do
  scenario "user can sign up" do
    visit '/posts'
    expect(page).to have_content("Jenstagram")
  end
end