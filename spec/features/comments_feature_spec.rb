require 'rails_helper'

feature 'commenting' do

  before do
    sign_up
    add_photo
  end

  scenario "allows users to leave a comment on a photo" do
    visit('/photos')
    click_link('Comment')
    fill_in 'Comment:', with: "Lookin' good"
    click_button('Leave comment')
    expect(page).to have_content("Looking' good")
  end

end
