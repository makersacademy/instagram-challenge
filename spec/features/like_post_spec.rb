require 'rails_helper'

RSpec.feature "Like post", type: :feature do
  scenario "User can like post if signed in" do
    user = FactoryBot.create(:user)
    sign_in(user)
    post_photo
    expect(page).to have_content "Like"
    click_link "Like"
    expect(page).to have_content "Total Likes: 1"
    expect(page).to have_content "UnLike"
  end

  scenario "User can unlike post if signed in" do
    user = FactoryBot.create(:user)
    sign_in(user)
    post_photo
    click_link "Like"
    expect(page).to have_content "Total Likes: 1"
    click_link "UnLike"
    expect(page).to have_content "Total Likes: 0"
  end
end
