require 'rails_helper'

feature 'upvoting user comments' do
  
  context 'whilst on the main page' do
    
    scenario "upvoting updates the counter by 1", js: true do
      user = build(:user)
      sign_up(user)
      create_post
      visit root_path
      click_link "upvote"
      expect(page).to have_content('1 upvote')
    end

    scenario "comments start with zero 'upvotes'" do
      user = build(:user)
      sign_up(user)
      create_post
      expect(page).not_to have_content('1 upvote')
    end


    scenario "unregisted users cannot upvote" do
      
    end

    scenario "users can only upvote once" do
      
    end



  end

end