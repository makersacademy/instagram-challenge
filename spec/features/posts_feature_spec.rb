require 'rails_helper'

feature 'User posts' do

  context 'when a user reaches the home page' do

    scenario 'it can make a new post' do
      user = build(:user)
      sign_up(user)
      create_post
      expect(page).to have_content "test post!"
    end

    scenario 'only if signed in' do
      visit root_path
      expect(page).not_to have_link "Create post"
    end

    scenario 'users can upload pictures' do
      user = build(:user)
      sign_up(user)
      upload_picture
      page.has_content? "reset_5.png'"
    end

    scenario 'users can view individuals posts' do
      user = build(:user)
      sign_up(user)
      upload_picture
      click_link "test post!"
    end

  end
  
end