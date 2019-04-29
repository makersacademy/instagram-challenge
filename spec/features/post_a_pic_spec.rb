# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Post a pic", type: :feature do
  it "The feed page has a 'post a pic' link" do
    visit "/pics"
    expect(page).to have_link "Post a pic"
  end

  it "The post a pic page has an image upload field" do
    visit "/pics/new"
    expect(page).to have_field "Image"
  end

  it "Posting a pic redirects to the feed" do
    visit "/pics/new"
    attach_file("Image", Rails.root + "spec/fixtures/files/happy-face.png")
    click_button "Save"
    expect(page).to have_current_path("/pics")
  end

  it "After posting a pic the pic appears in the feed" do
    # ??
  end
end
