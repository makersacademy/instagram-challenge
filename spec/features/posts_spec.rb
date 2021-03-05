require 'rails_helper'
require 'web_helpers'

feature "Sign up" do

  scenario "can sign up" do
    sign_up
    expect(page).to have_content('test@email.com')
    expect(current_path).to eq('/')
  end

  scenario "only signed-in users can add a post" do
    add_post
  end

  scenario "signed out users do not see 'New post' button" do
    visit '/posts'
    expect(page).not_to have_content("New")
  end

  scenario "signed out users are told to sign in to post" do
    visit '/posts'
    expect(page).to have_content("Sign in to make frames")
  end

  scenario "signed in users see their user.email on the page" do
    sign_up
    expect(page).to have_content("test@email.com")
  end

  scenario "signed_in users can click on post link" do
    add_post
    click_on("Back")
    click_on("This is just a test title")
  end

end

feature "Post image" do

    scenario "it can add a new post" do
      add_post
      expect(page).to have_content "This is just a test title"
      expect(page).to have_content "And this is a test comment"
      expect(page).to have_content "And this is a test comment"
      expect(page.find('img')['src']).to have_content 'claude.png'
    end

    scenario "it displays all posts on the main page" do
      add_post
      p "Added first post"
      click_on("Back")
      p "Back on home page"
      add_second_post
      click_on("Back")
      expect(page).to have_content "This is just a test title"
      expect(page).to have_content "And this is a test comment"
      expect(page.find('#image_1')['src']).to have_content 'claude.png'
      expect(page).to have_content "This is just a second test title"
      expect(page).to have_content "And this is a second test comment"
      expect(page.find('#image_2')['src']).to have_content 'claude.png'
    end

  end

feature "add comment" do


  scenario "it allows signed_in users to comment on a picture" do
    add_post
    click_on("Back")
    click_on("This is just a test title")
    add_comment
  end

end


#   feature "request to book" do
#   scenario "to be able to click book button" do
#     sign_up
#     adding_property
#     visit ('/')
#     click_link "Sign up"
#     fill_in :username, with: "bill"
#     fill_in :password, with: "123"
#     fill_in :email, with: "bill@email.com"
#     click_button "Confirm sign up"
#     click_button "Book property"
#     expect(page).to have_content "Here are your booking details"
#   end
