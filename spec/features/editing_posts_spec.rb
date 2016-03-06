require 'spec_helper'

feature 'Can view individual posts' do
  scenario 'can click and view a single post' do
    post = create(:post)
    visit '/'
    p post.id
    find(:xpath, "//a[contains(@href,'posts/4')]").click
    click_link 'Edit Post'
    fill_in 'Caption', with: 'Comment has been edited'
    click_button 'Update Post'
    expect(page).to have_content 'Post was updated'
    expect(page).to have_content 'Comment has been edited'
  end
end