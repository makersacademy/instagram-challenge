require 'rails_helper'

feature 'User posts' do
  
  context 'when a user reaches the home page' do

    scenario 'it can make a new post' do
      user = build(:user)
      create_post(user)
      expect(page).to have_content "test post!"
    end

  end
  
end