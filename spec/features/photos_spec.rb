require "rails_helper"

RSpec.feature "App is launched with images feed" do
  scenario "home page has photo feed" do
    visit "/"
    expect(page).to have_css('.uploads')
    expect(page).to have_css('#post_section')
    expect(page).to have_content('Picture Sharing Thingy')
  end
end
