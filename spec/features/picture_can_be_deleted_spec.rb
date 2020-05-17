require 'rails_helper'

RSpec.feature 'Delete Image', type: :feature do
  before do
    first_user = FactoryBot.create(:user)
    login_as(first_user)
    upload_image
  end

  scenario 'user can delete their own image' do
    find(:xpath, "//a/img[@alt='image']/..").click
    click_link 'Destroy'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Picture was successfully destroyed.'
    expect(page).not_to have_css 'img[src*="cat.jpeg"]'
  end

  scenario "user can't delete another user's image" do
    click_link 'Log Out'
    second_user = FactoryBot.create(:user)
    login_as(second_user)
    find(:xpath, "//a/img[@alt='image']/..").click
    expect(page).not_to have_link 'Destroy'
  end

end
