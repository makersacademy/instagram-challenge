require 'rails_helper'

feature 'comments' do
  before { Post.create title: 'dogs' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment on dog'
     fill_in "Content", with: "cute"
     click_button 'Post Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('cute')
  end

end
