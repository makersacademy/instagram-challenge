# require 'rails_helper'
#
# feature 'Instructing visitors' do
#   context 'A user is not signed in' do
#     scenario 'Should request that a user logs in' do
#       visit '/'
#       expect(page).to have_content 'Please log in to start posting your photos'
#       expect(page).not_to have_content 'Sign out'
#     end
#   end
#
#   context 'A user is signed in' do
#     scenario 'Should welcome the user' do
#     visit '/'
#     click_link 'Sign in'
#     fill_in 'email', with: 'test@test.com'
#     fill_in 'password', with: 'Password'
#     click_link 'Submit'
#     expect(page).to have_content 'Welcome Sam'
#     end
#   end
# end
