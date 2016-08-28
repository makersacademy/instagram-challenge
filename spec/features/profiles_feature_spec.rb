require 'rails_helper'

feature 'profile page' do

  before do
    sign_up
    new_post
  end

  scenario "shows a user's own photos" do
    visit posts_path
    click_link "@tc"
    expect(page).to have_css("img[src*='jackspoint.jpeg']")
  end




end
