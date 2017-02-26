require 'rails_helper'

feature "commenting" do
  before {Picture.create description: "description"}

  scenario "allows users to leave comments on pictures using a special forms" do
    visit pictures_path
    click_link "Leave comment"
    fill_in "Thoughts", with: "Beautiful!"
    click_button "Submit Comment"
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('Beautiful!')
  end
end
