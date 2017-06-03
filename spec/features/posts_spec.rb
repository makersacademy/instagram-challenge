require 'rails_helper'

RSpec.feature "Routing", type: :feature do
  scenario "User can post an image" do
    sign_up
    user_makes_post
    expect(page).to have_content("Hello, world!")
  end
end
