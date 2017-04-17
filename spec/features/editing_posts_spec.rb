# require 'rails_helper'
#
# feature 'Editing Posts' do
#   background do
#     user = create(:user)
#     user_2 = create(:user , email: 'monkey2@jungle.com', user_name: 'monkey1234', id: 2)
#     post = create(:post,  user_id: user.id )
#     post_2 = create(:post, id: 2,  user_id: 2 )
#     visit '/'
#     click_link 'Sign In'
#     sign_in(user)
#   end
#
#   scenario 'I can edit a post as the creator' do
#     visit '/'
#     find(:xpath, "//a[contains(@href,'posts/1')]").click
#     # find(:xpath, "//a/img[@alt='Monkey']/..").first.click
#     click_link 'Edit Post'
#     fill_in 'Caption', with: 'This is a bad pic'
#     click_button 'Update Post'
#
#     expect(page).to have_content('Post has been updated!')
#     expect(page).to have_content('This is a bad pic')
#   end
#
#   scenario 'I cannot edit a post that I did not create' do
#     visit '/'
#     find(:xpath, "//a[contains(@href,'posts/2')]").click
#     expect(page).not_to have_content 'Edit Post'
#   end
#
#   scenario 'I cannot bypass the constrainsts through the URL path' do
#     visit "/posts/2/edit"
#     expect(page.current_path).to eq root_path
#     expect(page).to have_content("That post doesn't belong to you!")
#   end
#
#   scenario "won't update a post without an image" do
#     visit '/'
#     find(:xpath, "//a[contains(@href,'posts/1')]").click
#     click_link 'Edit Post'
#     attach_file('Image', 'spec/files/images/monkey.jpg.zip')
#     click_button 'Update Post'
#
#     expect(page).to have_content('You need to upload a valid image!')
#   end
#
# end
