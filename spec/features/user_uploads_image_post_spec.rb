# frozen_string_literal: true

require 'rails_helper'

feature "User Adds Pentapost" do
  scenario "successfully" do
    signup
    fill_in "Caption", with: "Love Metal!"
    attach_file("Picture", Rails.root + "spec/fixtures/metal.png")
    click_on "Add Pentapost"
    expect(page).to have_css '.caption', text: "Love Metal!"
    expect(page).to have_css '.photo'
  end
end
