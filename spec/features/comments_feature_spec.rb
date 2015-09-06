require 'rails_helper'

feature 'commenting' do
  before {Photo.create title: 'sunset'}

  scenario 'allows users to leave a commenting using a form' do
     visit '/photos'
     click_link 'Comment sunset'
     fill_in "Thoughts", with: "Nice picture"
     click_button 'Leave Comment'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('Nice picture')
  end

end