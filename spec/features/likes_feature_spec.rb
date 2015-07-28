require 'rails_helper'

feature 'liking pictures' do
  scenario 'a photo can be liked, and the count will update', js: true do
    visit '/pictures'
    click_link 'Add a picture'
    # expect(current_path).to eq '/pictures/new'
    attach_file "Image", "spec/asset_specs/photos/photo.jpg"
    click_button "Post"
    click_link "like"
    expect(page).to have_content('1 like')
  end
end
