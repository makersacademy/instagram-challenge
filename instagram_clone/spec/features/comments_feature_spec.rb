require 'rails_helper'

feature 'commenting' do
  before(:each) do
    visit '/'
    click_link 'Sign up'
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign up"
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
end