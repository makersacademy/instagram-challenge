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

  end
  
end