require 'rails_helper'

RSpec.feature "homepage", type: :feature do
  scenario "Can submit photos with captions and view them" do
    sign_up_and_sign_in
    make_post
    expect(page).to have_css("img[src*='Iceland_Northern_Lights_Special_4_Nights_1.jpg']")
    expect(page).to have_content('example')
  end

  scenario "Submitting an image increases post count by 1" do
    sign_up_and_sign_in
    make_post
    expect(Post.count).to eq(1)
  end

  scenario "A submitted post displays the associated username" do
    sign_up_and_sign_in
    make_post
    expect(page).to have_content('Example')
  end

  scenario "User can log out" do
    sign_up_and_sign_in
    click_link "Log Out"
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end
