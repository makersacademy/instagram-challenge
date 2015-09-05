require 'rails_helper'

feature 'comments' do
  before {Photo.create description: 'Fujisan'}

  scenario 'allows users to leave a comment using a form' do
     visit '/photos'
     click_link 'Comment on'
     fill_in "Comment", with: "Epic mountain"
     click_button 'Leave Comment'

     expect(current_path).to eq '/photos'
     expect(page).to have_content('Epic mountain')
  end

  context 'an invalid comment' do
    it 'does not let user submit a blank comment' do
      visit '/photos'
      click_link 'Comment on'
      fill_in "Comment", with: ""
      click_button 'Leave Comment'
      expect(page).to have_content 'Comment cannot be blank'
    end
  end


end