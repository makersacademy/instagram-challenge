require 'rails_helper'

RSpec.describe "Post a pic", type: :feature do
  it "The feed page has a 'post a pic' link" do
    visit "/feed"
    expect(page).to have_link "Post a pic"
  end

  it "The post a pic page has an image upload field" do
    visit "/pics/new"
    expect(page).to have_field "Image"
  end
end
