require 'spec_helper'
require'rails_helper'

feature 'fill out form ' do

  scenario "Fills out form to create new post" do
    visit '/posts/new'
    attach_file "Image", '/Users/elizabethwicks/Downloads/Vogue-1939-1440x900.jpg'
    fill_in "Tag", with: "Picture"
    click_button "Create Post"
    expect(page).to have_content("Picture")

  end


end
