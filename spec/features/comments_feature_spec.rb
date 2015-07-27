require 'rails_helper'

feature 'comments' do
  scenario 'allows comments to be added to pictures' do
    visit '/pictures'
    click_link 'Add a picture'
    expect(current_path).to eq '/pictures/new'
    attach_file "Image", "spec/asset_specs/photos/photo.jpg"
    click_button "Post"
    expect(page).to have_link "Add a comment"
    expect(current_path).to eq '/pictures'
    click_link "Add a comment"
    fill_in "Message", with: "Nifty!"
    click_button "Comment"
    expect(page).to have_content "Nifty!"
  end

end
