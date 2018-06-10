require 'rails_helper'

feature "posts are displayed on the index page" do
  scenario "several posts are displayed with images" do
    sign_up_and_sign_in
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/mum.jpeg")
    fill_in 'post[description]', with: 'me and my sweet kids'
    click_button 'submit'
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/Kate.jpg")
    fill_in 'post[description]', with: 'me and my Bubba'
    click_button 'submit'
    expect(page).to have_content("me and my sweet kids")
    expect(page).to have_content("me and my Bubba")
    expect(page).to have_css("img[src*='mum']")
    expect(page).to have_css("img[src*='Kate']")
  end
end
