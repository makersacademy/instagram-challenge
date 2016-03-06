require 'rails_helper'

feature 'comments' do

  context 'adding comments' do

    before :each do
      travel_to(2.days.ago) do
        post = FactoryGirl.create(:post)
      end
      signup
    end

    scenario 'allows users to add a comment using a form' do
       visit '/'
       click_link 'More'
       fill_in "Comment", with: "a new comment"
       click_button 'Leave comment'
       expect(page).to have_content('a new comment')
    end

    scenario 'can not add a comment if not signed in' do
      visit '/'
      expect(page).to_not have_content('Leave comment')
    end

    scenario 'comments display the time relative to created_at' do
      visit '/'
      click_link 'More'
      fill_in "Comment", with: "a new comment"
      click_button 'Leave comment'
      expect(page).to have_content('less than a minute')
    end

  end

  context 'deleting comments' do

    scenario 'removes a comment when a user clicks a delete link' do
      signup
      create_post
      visit '/posts'
      click_link 'More'
      fill_in "Comment", with: "a new comment"
      click_button 'Leave comment'
      expect(page).to have_content 'a new comment'
      click_link 'Delete comment'
      expect(page).not_to have_content 'a new comment'
    end

    scenario 'users can only delete own comments' do
      post = FactoryGirl.create(:post)
      visit '/'
      click_link 'More'
      expect(page).to have_content post.description
      expect(page).to_not have_button 'Leave comment'
    end


  end

end
