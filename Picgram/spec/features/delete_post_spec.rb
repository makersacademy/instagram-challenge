require 'rails_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'i want to delete this')

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Post deleted')
    expect(page).to_not have_content('i want to delete this')
  end
end
