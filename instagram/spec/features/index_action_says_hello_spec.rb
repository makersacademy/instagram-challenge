require 'rails_helper'


RSpec.feature "welcom#index", type: :feature do
  scenario "page when visited must say hello" do
    visit('/')
    expect(page).to have_content('Hello')
  end
end