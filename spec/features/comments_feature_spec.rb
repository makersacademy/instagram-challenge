require 'rails_helper'

feature 'commenting' do
  before { Post.create description: 'This is a post' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'This is a post'
     click_link 'Comment'
     fill_in "Thoughts", with: "Meh!"
     select '2', from: 'Rating'
     click_button 'Leave Comment'
     expect(current_path).to eq '/posts'
     click_link 'This is a post'
     expect(page).to have_content('Meh!')
  end

end
