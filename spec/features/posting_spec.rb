require 'rails_helper'
require_relative '../test_helpers'

RSpec.feature 'Posting', type: :feature do
  scenario 'posting' do
    user_sign_up
    visit '/posts'
    click_link 'New Post'
    fill_in "post[description]", with: "My post desrciption"
    attach_file("post[image]", upload_image)
    click_button "Create Post"
    expect(page).to have_content("Post was successfully created.")
  end

  scenario "visitors can't post" do
    visit '/posts/new'
    expect(page).to have_current_path('/users/sign_in')
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

  scenario 'post can only be edited by the user who created the post' do
    user_sign_up
    create_new_post
    user_sign_out
    user2_sign_up
    visit '/posts/1/edit'
    expect(page).to have_current_path('/posts')
  end

  scenario 'post can not be edited by visitors' do
    user_sign_up
    create_new_post
    user_sign_out
    visit '/posts/1/edit'
    expect(page).to have_current_path('/users/sign_in')
  end
end
