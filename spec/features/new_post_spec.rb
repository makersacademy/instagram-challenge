require 'rails_helper'

RSpec.feature "Post image", type: :feature do
  scenario "User sees link to create new post" do
    visit '/posts'
    expect(page).to have_link 'New post'
  end

  scenario "User can post image" do
    visit '/posts'
    click_link 'New post'
    fill_in 'post_caption', with: 'Cute cat'
    page.attach_file('post_image', Rails.root + "spec/fixtures/stanley.jpg")
    click_button 'Create post'
    expect(page).to have_content('Cute cat')
    expect(page).to have_css("img[src*='stanley.jpg']")
  end
end
