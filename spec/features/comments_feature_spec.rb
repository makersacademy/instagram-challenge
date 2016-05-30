require 'rails_helper'

feature 'commenting' do
  before {Post.create title: 'Sunny Day', description: 'At the park'}

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Sunny Day'
     click_link 'Comment on Sunny Day'
     fill_in "Thoughts", with: "Nice pic!"
     click_button 'Leave Comment'
     expect(current_path).to eq post_path(Post.last)
     expect(page).to have_content('At the park')
  end

end
