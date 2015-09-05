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

end