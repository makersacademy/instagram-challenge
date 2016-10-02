require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post, caption: 'My little cat')
    user = create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'mr_deadpool@marvel.com'
    fill_in 'Password', with: 'chimichanga'
    click_button 'Log in'

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
