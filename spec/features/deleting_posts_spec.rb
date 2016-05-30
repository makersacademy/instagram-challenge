require 'rails_helper'

feature 'Deleting posts' do
  scenario 'Can delete a single post' do
    sign_up_test
    create_post
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    click_link 'Delete Post'
    expect(page).to have_content('Post deleted')
    expect(page).to_not have_content('This tastes good')
  end
end