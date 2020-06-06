require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/"
    expect(page).to have_content("Instagram")
  end
end
