require "rails_helper"

RSpec.feature 'Picture Post' do
  scenario 'User can post a picture' do
    sign_in
    visit '/posts/new'
    attach_file('post_photo', Rails.root + "public/images/infiltration_cat.jpg")
    fill_in 'post_caption', with: 'Day 47: Meerkats Infiltrated'
    click_button 'Submit'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Day 47: Meerkats Infiltrated'
    expect(page).to have_xpath("//img[contains(@src,'infiltration_cat.jpg')]")
  end
end
