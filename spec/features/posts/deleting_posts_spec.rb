require 'rails_helper'

feature 'Deleting posts' do
  background do
    user = create :user
    post = create(:post, caption: 'Check me out, beautiful like the sun.', user_id: user.id)

    sign_in_with user

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Your post has been wiped off.')
    expect(page).to_not have_content('Check me out, beautiful like the sun.')
  end
end
