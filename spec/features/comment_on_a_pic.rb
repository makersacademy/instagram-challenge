require 'rails_helper'

RSpec.describe "Commenting", type: :feature do
  xit "A picture in the feed has a 'comment' button" do
    visit "/pics/new"
    attach_file("Image", Rails.root + "spec/fixtures/files/happy-face.png")
    click_button "Save"
    expect(page).to have_link "Pass comment on this pic"
  end
end
