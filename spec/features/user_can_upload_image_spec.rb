require 'rails_helper'

RSpec.feature 'Upload Image', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    click_link 'New Picture'
  end

  scenario "user can upload an image" do
    attach_file 'Image', Rails.root + 'spec/fixtures/cat.jpeg'
    click_button 'Create Picture'
    expect(page).to have_content 'Picture was successfully created.'
    expect(page).to have_css 'img[src*="cat.jpeg"]'
  end

end
