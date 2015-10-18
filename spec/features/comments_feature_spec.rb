require 'rails_helper'

feature 'commenting' do
  before {Photo.create caption: 'sunrise'}

  scenario 'allows users to leave a comment using a form' do
     visit '/photos'
     click_link 'Leave a comment'
     fill_in "Comment", with: "nice photo"
     click_button 'Leave Comment'

     expect(current_path).to eq '/photos'
     expect(page).to have_content('nice photo')
  end
end