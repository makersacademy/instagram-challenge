require 'rails_helper'

feature 'Deleting posts' do
  background do
    user = create(:user)
    create(:post, description: 'Not my photo #yolo', user_id: user.id)
    sign_in user
    find(:xpath, "//a[contains(@href,'posts/1')]", match: :prefer_exact).click
    click_link 'Edit Post'
  end

  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Post deleted.')
    expect(page).to_not have_content('Not my photo #yolo')
  end
end
