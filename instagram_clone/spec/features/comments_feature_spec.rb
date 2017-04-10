require 'rails_helper'

feature 'commenting', focus: true do
  before { Post.create description: 'Great Day' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment'
     fill_in 'Comment', with: 'so so'
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts/1'
     expect(page).to have_content('so so')
   end
end
