require 'rails_helper'

feature 'liking posts' do
  # before(:each) do
  #   visit '/'
  #   click_link 'Sign up'
  #   fill_in "Email", with: "rob@test.com"
  #   fill_in "Password", with: "12345678"
  #   fill_in "Password confirmation", with: "12345678"
  #   click_button "Sign up"
  #   click_link "Make a post"
  #   fill_in "Title", with: "I love cheese"
  #   attach_file("post[image]", "spec/assets/images/KFC.jpg")
  #   click_button "Post"
  # end

  # before(:each) do
  #   post = Post.create(title: "blah")
  # end

  scenario 'users can like a post, which updates the like count', js: true do
    user = build(:user)
    sign_up user
    click_link "Make a post"
    fill_in "Title", with: "I love cheese"
    attach_file("post[image]", "/Users/Sarah/Documents/Projects/programs/Makers/Challenges/instagram-challenge/instagram_clone/spec/assets/images/KFC.jpg")
    click_button "Post"
    expect(page).to have_content "Like"
    click_link "Like"
    expect(page).to have_content "1 Like"
  end

  scenario 'user can only like post once', js: true do
    user = build(:user)
    sign_up user
    click_link "Make a post"
    fill_in "Title", with: "I love cheese"
    attach_file("post[image]", "/Users/Sarah/Documents/Projects/programs/Makers/Challenges/instagram-challenge/instagram_clone/spec/assets/images/KFC.jpg")
    click_button "Post"
    click_link "Like"
    click_link "Like"
    expect(page).to have_content "1 Like"
  end

  context "on post page" do
    scenario 'users can like a post, which updates the like count', js: true do
      user = build(:user)
      sign_up user
      click_link "Make a post"
      fill_in "Title", with: "I love cheese"
      attach_file("post[image]", "/Users/Sarah/Documents/Projects/programs/Makers/Challenges/instagram-challenge/instagram_clone/spec/assets/images/KFC.jpg")
      click_button "Post"
      # find("img[alt='Kfc']").click
      visit "/posts/1"
      click_link "Like"
      expect(page).to have_content "1 Like"
    end

    scenario 'user can only like post once', js: true do
      user = build(:user)
      sign_up user
      click_link "Make a post"
      fill_in "Title", with: "I love cheese"
      attach_file("post[image]", "/Users/Sarah/Documents/Projects/programs/Makers/Challenges/instagram-challenge/instagram_clone/spec/assets/images/KFC.jpg")
      click_button "Post"
      # find("img[alt='Kfc']").click
      visit "/posts/1"
      expect(page).to have_content "0 Likes"
      click_link "Like"
      click_link "Like"
      expect(page).to have_content "1 Like"
    end
  end
end