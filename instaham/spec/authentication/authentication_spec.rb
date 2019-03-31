require 'rails_helper'

RSpec.feature "Timeline", type: :feature, js: true do
  scenario "Can submit posts and view them" do
    visit "/"
    expect(page).to have_content("Welcome#index")
  end
end
