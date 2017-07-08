require 'rails_helper'

RSpec.feature "Upload photo", type: :feature do
  scenario "Can upload photo and view them" do
    sign_in
    click_on "Add new"
    fill_in "Title", with: "Hello, world!"
    attach_file('post_photo', Rails.root + "spec/factories/Trollface.png")
    click_button "Upload"
    expect(page).to have_xpath("//img[contains(@src,'Trollface.png')]")
  end
end
