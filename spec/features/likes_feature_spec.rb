require 'rails_helper'

feature 'liking pictures', js: true do
  scenario 'a photo can be liked, and the count will update' do
    visit '/pictures'
    click_link 'Add a picture'
    attach_file "Image", "spec/asset_specs/photos/test.jpg"
    click_button "Post"
    click_link "Like"
    expect(page).to have_content('1 like')
  end
end
