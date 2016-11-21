# require 'rails_helper'

# feature 'Deleting posts' do
#   background do
#     post = create(:post, caption: 'Abs for days.')

#     visit '/'

#     find(:xpath, "//a[contains(@href,'posts/1')]").click
#     click_link 'Edit Post'
#   end
#   scenario 'Can delete a single post' do
#     click_link 'Delete Post'

#     expect(page).to have_content('Problem solved!  Post deleted.')
#     expect(page).to_not have_content('Abs for days.')
#   end
# end