require 'rails_helper'
require 'web_helper'

feature 'Users can comment on a post' do
  scenario 'user comments on a post' do
    create_new_user
    visit '/posts'
    visit new_post_path
    page.attach_file("post_image", Rails.root + 'spec/fixtures/Cookies.jpg')
    fill_in 'Caption', with: 'Caption'
    click_button('Create Post')
    fill_in 'comment_content', with: "example comment"
    click_button "Add"
    expect(page).to have_content("example comment")
  end

  scenario 'user can only delete their own comments' do
    create_new_user
    visit '/posts'
    visit new_post_path
    page.attach_file("post_image", Rails.root + 'spec/fixtures/Cookies.jpg')
    fill_in 'Caption', with: 'Caption'
    click_button('Create Post')
    fill_in 'comment_content', with: "example comment"
    click_button "Add"
    expect(page).to have_button("Delete comment")
  end

    scenario 'comments are successfully deleted' do
      create_new_user
      visit '/posts'
      visit new_post_path
      page.attach_file("post_image", Rails.root + 'spec/fixtures/Cookies.jpg')
      fill_in 'Caption', with: 'Caption'
      click_button('Create Post')
      fill_in 'comment_content', with: "new comment"
      click_button "Add"
      click_button "Delete comment"
      expect(page).not_to have_content("new comment")
    end
end
