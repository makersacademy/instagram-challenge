# require 'rails_helper'
#
# feature 'comments' do
#   before { Post.create description: 'Test post' }
#
#   scenario 'display a form for users to comment on a post' do
#     visit '/posts'
#     fill_in 'comment-body', with: 'Test comment'
#     click_button 'Comment'
#     expect(page).to have_content 'Test comment'
#   end
# end
