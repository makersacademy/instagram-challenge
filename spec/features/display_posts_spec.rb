require 'rails_helper'

RSpec.feature "Display posts", type: :feature do

  scenario "Displaying images and captions on index page" do
    create_crepe_post
    create_penguin_post

    visit "/"
    expect(page).to have_content("Weekend Brunch #crepes")
    expect(page).to have_content("Baby Penguins #cute")
    expect(page).to have_css('img[src*="crepes.jpg"]')
    expect(page).to have_css('img[src*="penguins.jpg"]')
  end
end
