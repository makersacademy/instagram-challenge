require 'rails_helper'

feature 'Delete post' do
  background do
    sign_in_as_valid_user
    post = create(:post, text: 'Post to delete')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'delete the post' do
    click_link 'Delete Post'

    expect(page).to have_content('Post deleted.')
    expect(page).to_not have_content('Post to delete')
  end
end
