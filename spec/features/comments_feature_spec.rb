  require 'rails_helper'

  feature 'reviewing' do
    before {Post.create message: 'Hello World'}

    scenario 'allows users to leave a review using a form' do
       visit '/posts'
       click_link 'Add comment'
       fill_in 'Message', with: 'I agree'
       click_button 'Leave Comment'
       expect(current_path).to eq '/posts'
       expect(page).to have_content('I agree')
    end

    scenario 'deleting a post deletes the comments as well' do
      visit '/posts'
      click_link 'Delete post'
      expect(page).not_to have_content('I agree')
    end

  end
