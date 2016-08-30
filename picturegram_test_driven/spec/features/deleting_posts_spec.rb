require 'rails_helper'

feature 'deleting posts' do
  background do
    user = create(:user)
    post = create(:post, caption: "This is my original post.")
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'jillygates@outlook.com'
    fill_in 'Password', with: 'dotcom'
    click_button 'Log in'
    find("a[href='#{post_path(post)}']").click
    expect(page.current_path).to eq(post_path(post))
    click_link 'Edit Post'
  end
  scenario 'can delete a post' do
    click_link 'Delete Post'
    expect(page.current_path).to eq(posts_path)
    expect(page).to_not have_content('This is my original post.')
  end

end
