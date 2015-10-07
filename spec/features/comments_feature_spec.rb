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

  scenario 'user can edit their comment' do
    visit '/posts'
    click_link 'Leave comment'
    fill_in "Thoughts", with: "Oh, wow, this looks great!"
    click_button "Comment"
    click_link "Edit comment"
    fill_in "Thoughts", with: "Oh, wow, this looks to be the greatest!"
    click_button "Comment"
    expect(page).to have_content "Oh, wow, this looks to be the greatest!"
  end

  scenario 'user cannot edit someone else\'s comment' do
    visit '/posts'
    click_link 'Leave comment'
    fill_in "Thoughts", with: "Oh, wow, this looks great!"
    click_button "Comment"
    click_link 'Sign out'
    user_2 = build(:user, username: "otterface", email: "b@alphabet.com")
    sign_up user_2
    visit "/posts"
    expect(page).not_to have_content "Edit comment"
  end

  scenario 'user can delete their comment' do
    visit '/posts'
    click_link 'Leave comment'
    fill_in "Thoughts", with: "Oh, wow, this looks great!"
    click_button "Comment"
    click_link "Delete comment"
    expect(page).not_to have_content "Oh, wow, this looks great!"
    expect(page).to have_content "Successfully deleted"
  end

  scenario 'user cannot delete someone else\'s comment' do
    visit '/posts'
    click_link 'Leave comment'
    fill_in "Thoughts", with: "Oh, wow, this looks great!"
    click_button "Comment"
    click_link 'Sign out'
    user_2 = build(:user, username: "otterface", email: "b@alphabet.com")
    sign_up user_2
    visit "/posts"
    expect(page).not_to have_content "Delete comment"
  end
end