# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Post photo", type: :feature do
  scenario "User can post photo if signed in" do
    user = FactoryBot.create(:user)
    sign_in(user)
    expect(current_path).to eq "/posts"
    post_photo
    expect(current_path).to eq "/posts"
    expect(page).to have_content "This is my photo caption #{user.username}"
  end

  scenario "User unable to post photo if no caption added" do
    user = FactoryBot.create(:user)
    sign_in(user)
    within ".navbar" do
      click_link "New Post"
    end
    expect(current_path).to eq "/posts/new"
    attach_file("Image", Rails.root + "spec/fixtures/photo1.png")
    click_button "Post!"
    expect(page).to have_content "can't be blank"
  end

  scenario "User unable to post photo if no attachment added" do
    user = FactoryBot.create(:user)
    sign_in(user)
    within ".navbar" do
      click_link "New Post"
    end
    expect(current_path).to eq "/posts/new"
    fill_in "Caption", with: "This is my photo caption"
    click_button "Post!"
    expect(page).to have_content "can't be blank"
  end

  scenario "User unable to post photo if invalid file type attachment added" do
    user = FactoryBot.create(:user)
    sign_in(user)
    within ".navbar" do
      click_link "New Post"
    end
    expect(current_path).to eq "/posts/new"
    fill_in "Caption", with: "This is my photo caption"
    attach_file("Image", Rails.root + "spec/fixtures/Eloquent_JavaScript.pdf")
    click_button "Post!"
    expect(page).to have_content "File must be a png, jpg or jpeg"
  end

  scenario "User unable to post photo if file size over 2MB" do
    user = FactoryBot.create(:user)
    sign_in(user)
    within ".navbar" do
      click_link "New Post"
    end
    expect(current_path).to eq "/posts/new"
    fill_in "Caption", with: "This is my photo caption"
    attach_file("Image", Rails.root + "spec/fixtures/apple.jpg")
    click_button "Post!"
    expect(page).to have_content "File must be under 2MB"
  end

  scenario "User unable to post photo unless signed in" do
    visit "/posts"
    expect(page).not_to have_link "New Post"
  end
end
