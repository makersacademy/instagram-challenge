require 'rails_helper'
require_relative '../test_helpers'

RSpec.feature 'Posting', type: :feature do
  scenario 'posting' do
    user_sign_up
    visit '/posts'
    click_link 'New Post'
    # visit '/posts/new'
    fill_in "post[description]", with: "My post desrciption"
    attach_file("post[image]", upload_image)
    click_button "Create Post"
    expect(page).to have_content("Post was successfully created.")
  end

  scenario "visitor can't post" do

  end

  scenario 'posting' do
    user_sign_up
    visit '/posts'
    click_link 'New Post'
    fill_in "post[description]", with: "My post desrciption"
    click_button "Create Post"
    expect(page).to have_content("Image can't be blank")
  end
end

RSpec.feature 'Post editing', type: :feature do
  scenario 'post can be edited' do
    user_sign_up
    create_new_post
    visit '/posts'
    click_link('Edit')
    fill_in "post[description]", with: "My NEW post desrciption"
    click_button "Update Post"
    expect(page).to have_content("Post was successfully updated.")
  end
end
