require 'rails_helper'
require 'create_user_and_sign_up'

RSpec.feature "Likes", type: :feature do
  scenario "User can like their own image" do
    create_user_and_sign_up
    click_link 'New post'
    fill_in 'post_caption', with: 'Cute cat'
    page.attach_file('post_image', Rails.root + "spec/fixtures/stanley.jpg")
    click_button 'Create post'
    click_button 'Like'
    expect(page).to have_content('1')
  end
end
