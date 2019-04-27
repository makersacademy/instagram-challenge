require 'rails_helper'
require 'create_user_and_sign_up'

RSpec.feature "Post image", type: :feature do
  scenario "User sees link to create new post" do
    create_user_and_sign_up
    visit '/posts'
    expect(page).to have_link 'New post'
  end

  scenario "User can post image" do
    create_user_and_sign_up
    visit '/posts'
    click_link 'New post'
    fill_in 'post_caption', with: 'Cute cat'
    page.attach_file('post_image', Rails.root + "spec/fixtures/stanley.jpg")
    click_button 'Create post'
    expect(page).to have_content('Cute cat')
    expect(page).to have_css("img[src*='stanley.jpg']")
  end
end
