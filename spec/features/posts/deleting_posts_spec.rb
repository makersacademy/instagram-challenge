require 'rails_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'Check me out, beautiful like the sun.')

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end
  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Your post has been wiped off.')
    expect(page).to_not have_content('Check me out, beautiful like the sun.')
  end
end
