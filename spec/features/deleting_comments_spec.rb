# require 'rails_helper'
#
# feature 'Deleting comments' do
#   background do
#     user = create :user
#     user_2 = create(:user , email: 'monkey2@jungle.com',
#                             user_name: 'monkey1234',
#                             id: 2)
#     post = create(:post,  user_id: user.id )
#     comment = Comment.create(user_id: user_2.id,
#                              post_id: post.id,
#                              content: 'Nice post!')
#     visit '/'
#     click_link 'Sign In'
#     sign_in(user_2)
#   end
#
#   scenario 'user can delete their own comments' do
#     visit '/'
#     expect(page).to have_content('Nice post!')
#     click_link 'flame-icon'
#     click_link 'OK'
#     expect(page).to_not have_content('Nice post!')
#   end
# end
