require 'rails_helper'

RSpec.feature "Liking a photo", type: :feature do
  scenario "Can like a post" do
    sign_up
    add_post
    click_link "Beautiful sunset"
    click_button "Like"
    expect(page).to have_content("1 Like")
  end
end
