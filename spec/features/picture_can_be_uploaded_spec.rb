require 'rails_helper'

RSpec.feature 'Upload Image', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
  end

  scenario "user can upload an image" do
    upload_image
    expect(page).to have_content 'Picture was successfully created.'
    expect(page).to have_css 'img[src*="cat.jpeg"]'
  end

end
