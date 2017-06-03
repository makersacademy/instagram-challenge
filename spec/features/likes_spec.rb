require 'rails_helper'

RSpec.feature "Likes", type: :feature do

  scenario "A post has a like button with like count" do
    sign_up
    user_makes_post
    expect(page).to have_button "Like (0)"
  end

  scenario "A user can like a post" do
    sign_up
    user_makes_post
    click_button "Like (0)"
    expect(page).to have_button("Like (1)", disabled: true)
  end

  scenario "A user cannot like a post twice" do
    sign_up
    user_makes_post
    click_button "Like (0)"
    expect(page).not_to have_button("Like (1)", disabled: false)
  end

end
