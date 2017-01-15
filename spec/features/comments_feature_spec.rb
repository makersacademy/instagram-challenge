require 'rails_helper'

feature 'comments' do
  before { Photo.create description: 'A fun day at the beach!', id: 1 }

  scenario 'allows users to comment' do
     visit '/photos'
     click_link 'A fun day at the beach!'
     click_link 'Add comment'
     fill_in "Remark", with: "My favourite pic <3"
     click_button 'Post comment'

     expect(current_path).to eq '/photos/1'
     expect(page).to have_content('My favourite pic <3')
  end

end
