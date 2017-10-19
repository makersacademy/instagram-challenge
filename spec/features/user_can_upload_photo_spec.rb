require 'rails_helper'

RSpec.feature "Upload photo", type: :feature do
  scenario "Can upload photo and view them" do
    sign_in_and_post
    expect(page).to have_xpath("//img[contains(@src,'Trollface.png')]")
  end
end
