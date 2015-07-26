require 'rails_helper'

feature 'likes' do
  before do
    visit '/pictures'
    click_link 'Add a picture'
    attach_file "Image", "spec/asset_specs/photos/uku.jpg"
    click_button 'Create Picture'
  end

  scenario 'liking a picture' do
    visit '/pictures'
    click_button 'Like'
    expect(page).to have_content '1 like'
    expect(Picture.all[0].likes.count).to eq 1
  end
end