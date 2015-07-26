require 'rails_helper'

feature 'comments' do
  before do
    visit '/pictures'
    click_link 'Add a picture'
    attach_file "Image", "spec/asset_specs/photos/uku.jpg"
    click_button 'Create Picture'
  end

  scenario 'pictures can be commented on' do
    visit '/pictures'
    click_link 'Comment'
    fill_in 'Message', with: 'Beautiful'
    click_button 'Add Comment'
    expect(page).to have_content 'Beautiful'
    expect(Picture.all[0].comments.count).to eq 1
  end
end