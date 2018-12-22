require 'rails_helper'

feature 'Editing posts' do
  background do
    user = create :user
    post = create(:post, caption: 'Abs for days.', user_id: user.id)

    sign_in_with user
  end
  scenario 'Can delete a post' do
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'

    click_link 'Delete Post'

    expect(page).to have_content('Post successfully deleted.')
    expect(page).to_not have_content('Abs for days.')
  end
end
