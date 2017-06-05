require 'rails_helper'

RSpec.feature "Posting images", type: :feature do
  scenario "User can post an image" do
    sign_up
    user_makes_post
    expect(find('#post-picture')).to be
    expect(page).to have_xpath("//img[contains(@src,'dog.jpg')]")
  end

  scenario "User cannot make a post without an image" do
    sign_up
    user_makes_bad_post
    expect(page).not_to have_xpath("//img[contains(@src,'dog.jpg')]")
  end
end
