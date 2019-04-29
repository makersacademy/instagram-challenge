# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Commenting", type: :feature do
  before do
    visit "/"
    fill_in "Email", with: "paul@paul.paul"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
  end

  it "Users can comment" do
    visit "/pics/new"
    attach_file("Image", Rails.root + "spec/fixtures/files/happy-face.png")
    click_button "Save"
    fill_in "Add a comment", with: "Wow nice pic"
    click_button "Pass judgement"
    expect(page).to have_content "Wow nice pic"
  end
end
