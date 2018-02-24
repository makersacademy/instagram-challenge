require 'rails_helper'

feature 'Deleting posts' do
  background do
    create(:post, description: 'Not my photo #yolo')
    user = create(:user)
    sign_in user
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Post deleted.')
    expect(page).to_not have_content('Not my photo #yolo')
  end
end
