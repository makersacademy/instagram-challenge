require 'rails_helper'

feature 'liking user posts' do
  
  context 'whilst on the main page' do
    
    scenario "posts start with zero 'likes'" do
      user = build(:user)
      sign_up(user)
      create_post
      expect(page).not_to have_content('1 like')
    end

    # scenario "updates the likes count" do
    #   user = build(:user)
    #   sign_up(user)
    #   create_post
    #   visit root_path
    #   click_link "like"
    #   expect(page).to have_content('1 like')
    # end

  end

end