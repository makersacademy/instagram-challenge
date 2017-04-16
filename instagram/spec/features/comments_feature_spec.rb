require 'rails_helper'

feature 'commenting' do
  before {Post.create name: 'Cat'}

  scenario 'allows users to leave a post using a form' do
     visit '/posts'
     click_link 'Comment Cat'
     fill_in "Thoughts", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('so so')
  end

end