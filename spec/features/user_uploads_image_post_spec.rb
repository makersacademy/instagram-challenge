require 'rails_helper'

feature "User Adds Pentapost" do
  scenario "successfully" do
    visit root_path
    fill_in "Caption", with: "Love Metal!"
    attach_file("Picture", Rails.root + "spec/fixtures/metal.png")
    click_on "Add Post"
    expect(page).to have_css '.caption h4', text: "Love Metal!"
    expect(page).to have_css '.photo img'
  end
end