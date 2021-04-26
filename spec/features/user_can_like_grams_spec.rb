require 'rails_helper'

RSpec.feature "Like a Gram", type: :feature do
  scenario "User can like a gram" do
    sign_up
    click_link "Create a post"
    attach_file "gram_image", "./spec/fixtures/dinosaur1.jpeg"
    fill_in "gram[body]", with: "This is my first gram."
    click_button "Submit"
    expect(page).to have_content("0 Rawwrrs")
    click_link "Rawwrrs"
    expect(page).to have_content("1 Rawwrrs")
  end
end
