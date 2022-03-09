require "rails_helper"

RSpec.feature "Post new content when authenticated", type: :feature do
  scenario "It shows the posts details" do
    visit "/users/sign_up"
    fill_in "user[username]", with: "Testing"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign Up"

    visit "/posts/new"
    attach_file("post[image]",
                File.join(Rails.root, '/spec/fixtures/images/git_github1.jpg'), :visible => false)

    fill_in "post[body]", with: "Hello World, my first photo"
    click_button "Post"

    expect(page).to have_css("img[src*='git_github1.jpg']")
    expect(page).to have_content("Hello World, my first photo")
  end
end