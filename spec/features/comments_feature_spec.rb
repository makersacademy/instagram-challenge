require 'rails_helper'

feature 'comments' do
  before {Post.create name: 'Bird'}

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment Bird'
     fill_in "Thoughts", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('so so')
  end

end
