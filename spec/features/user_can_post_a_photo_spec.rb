require 'rails_helper'

RSpec.feature "homepage", type: :feature do
  scenario "Can submit photos and view them" do
    visit('/')
    click_link "Sign up"
    fill_in "Email", with: 'example@hotmail.com'
    fill_in "Password", with: '123456'
    fill_in "Password confirmation", with: '123456'
    click_button "Sign up"
    page.attach_file("post_photo", File.absolute_path('./app/assets/images/Iceland_Northern_Lights_Special_4_Nights_1.jpg'))
    click_button "Submit"
    expect(page).to have_css("img[src*='Iceland_Northern_Lights_Special_4_Nights_1.jpg']")
  end
end
