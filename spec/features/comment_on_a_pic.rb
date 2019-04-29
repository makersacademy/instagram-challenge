# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Commenting", type: :feature do
  it "A picture in the feed has a 'comment' form" do
    visit "/pics/new"
    attach_file("Image", Rails.root + "spec/fixtures/files/happy-face.png")
    click_button "Save"
    expect(page).to have_field "Pass comment"
  end
end
