require './spec/rails_helper'
require './spec/web_helpers.rb'

# feature 'Comments:' do
#
#   describe 'comment on a post:' do
#     scenario 'user leaves a comment' do
#       user_login('alexa@gmail.com')
#           create_post
#           click_link 'Show'
#           click_link 'Logout'
#           user_login('dan@gmail.com')
#           click_link 'Show'
#           fill_in 'comment[body]', with: 'Great'
#           click_button 'Create Comment'
#           expect(page).to have_content 'Great'
#           expect(page).to have_content 'by dan@gmail.com'
#     end
#     end
#
#   describe 'deleting a comment' do
#     scenario 'user can delete their own comments' do
#       user_login('alexa@gmail.com')
#       create_post
#       click_link 'Show'
#       fill_in 'comment[body]', with: 'Really great'
#       click_button 'Create Comment'
#       visit '/posts'
#       click_link 'Delete'
#       expect(page).not_to have_content 'Really great'
#     end
#
#     scenario 'user can\'t delete other users comments' do
#       user_login('alexa@gmail.com')
#       create_post
#       click_link 'Show'
#       click_link 'Logout'
#       user_login('dan@gmail.com')
#       click_link 'Show'
#       fill_in 'comment[body]', with: 'Really great'
#       click_button 'Create Comment'
#       click_link 'Show'
#       expect(page).not_to have_content 'Destroy'
#     end
#   end
# end
