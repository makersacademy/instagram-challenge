require 'rails_helper'
require 'create_user_and_sign_up'

RSpec.feature "Comment", type: :feature do
  scenario "User can comment on a post" do
    create_user_and_sign_up
    click_link 'New post'
    fill_in 'post_caption', with: 'Cute cat'
    page.attach_file('post_image', Rails.root + "spec/fixtures/stanley.jpg")
    click_button 'Create post'
    fill_in 'comment_body', with: 'Your cat is super cute'
    click_button 'Add'
    expect(page).to have_content('Your cat is super cute')
  end
end
