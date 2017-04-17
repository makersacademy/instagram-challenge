# require 'rails_helper'
#
# feature 'post get likes' do
#   before {Post.create name: 'Bird'}
#
#   it 'a user can like a post, which increments the like count', js: true do
#     visit '/posts'
#     click_link 'Like it'
#     expect(page).to have_content("1 Likes")
#   end
#   end
