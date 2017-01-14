require 'rails_helper'

feature 'commenting' do
  before { Photo.create title: 'Test photo' }

  scenario 'allows users to leave a comment using a form' do
     visit '/photos'
     click_link 'Comment on Test photo'
     fill_in "Thoughts", with: "Testing comments"
     click_button 'Leave Comment'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('Testing comments')
  end

end
