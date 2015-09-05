require 'rails_helper'

feature 'liking posts' do
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

  scenario 'users can like a post, which updates the like count' js: true do
    visit '/posts'
    click_link "Like"
    expect(page).to have_content "1 Like"
  end
end