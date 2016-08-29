require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post, caption: 'My little cat')

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'user can delete a post' do
    click_link 'Delete Post'
    expect(page.current_path).to eq '/posts'
    expect(page).to have_content 'Post deleted!'
    expect(page).not_to have_content "My little cat"
  end

end
