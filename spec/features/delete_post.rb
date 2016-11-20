require 'rails_helper'

feature 'Delete posts' do
  background do
  create(:post, caption: 'Me and my friends')

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can delete a post' do
    click_link 'Delete Post'

    expect(page).to have_content('Post deleted.')
    expect(page).to_not have_content('Me and my friends')
  end
end
