require 'rails_helper'

feature 'comments' do
  scenario 'allows users to leave a comment' do
     post = Post.create(content: 'hey')
     visit '/posts'
     click_link 'Comment'
     fill_in "Content", with: "hey yourself"
     click_button 'Leave Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('hey yourself')
  end

end
