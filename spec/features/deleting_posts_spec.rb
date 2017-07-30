require 'rails_helper'

feature 'Deleting posts' do  
  background do
    user = create :user
    post = create(:post, {:caption => 'Try.', user: user})
    visit '/'
    signin
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can delete a single post' do
    click_link 'Delete Post'
    expect(page).to have_content('Post deleted.')
    expect(page).to_not have_content('Try.')
  end
end
