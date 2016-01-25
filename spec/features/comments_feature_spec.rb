require 'rails_helper'

feature 'commenting' do
  before { Post.create caption: 'Here is a test post' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment on post'
     fill_in "Text", with: "Test comment on test post"
     click_button 'Leave Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('Test comment on test post')
  end
end
