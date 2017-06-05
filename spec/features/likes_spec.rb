require 'rails_helper'

RSpec.feature "Likes", type: :feature do

  scenario "A post has a like button with like count" do
    sign_up
    user_makes_post
    expect(page).to have_css "#like-button"
  end

  scenario "A user can like a post" do
    sign_up
    user_makes_post
    find('#like-button').click
    expect(find('#like-button')).to have_content '1'
  end

  scenario "A user cannot like a post twice" do
    sign_up
    user_makes_post
    find('#like-button').click
    expect(find('#like-button')).to be_disabled
  end

end
