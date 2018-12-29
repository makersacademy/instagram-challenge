require 'rails_helper'

RSpec.feature "Post photo", type: :feature do
  scenario "User can post photo if signed in" do
    user = FactoryBot.create(:user)
    sign_in(user)
    expect(current_path).to eq "/posts"
    click_link "New Post"
    expect(current_path).to eq "/posts/new"
    fill_in "Caption", with: "This is my photo caption"
    attach_file("Image", Rails.root + "spec/fixtures/photo1.png")
    click_button "Post!"
    expect(current_path).to eq "/posts"
    expect(page).to have_content "This is my photo caption"
  end

  scenario "User unable to post photo unless signed in" do
    visit "/posts"
    expect(page).not_to have_content "New Post"
  end
end
