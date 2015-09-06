require 'rails_helper'

feature 'commenting' do
  before(:each) do
    user = build(:user)
    sign_up user
    click_link "Make a post"
    fill_in "Title", with: "I love cheese"
    attach_file("post[image]", "spec/assets/images/KFC.jpg")
    click_button "Post"
  end

  scenario 'allows users to comment on posts' do
    visit '/posts'
    click_link 'Leave comment'
    fill_in "Thoughts", with: "Oh, wow, this looks great!"
    click_button "Comment"
    expect(page).to have_content "Oh, wow, this looks great!"
  end

  scenario 'deleting posts deletes comments' do
    visit '/posts'
    click_link 'Leave comment'
    fill_in "Thoughts", with: "Oh, wow, this looks great!"
    click_button "Comment"
    click_link "Delete"
    expect(page).to have_content "successfully deleted!"
    expect(page).not_to have_content "Oh, wow, this looks great!"
  end
end