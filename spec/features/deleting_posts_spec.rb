require 'rails_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'Cant think of anything to type')
    visit '/'

    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    find(:xpath, "//a/img[@alt='Monkey']/..").click
    click_link 'Edit Post'
  end

  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Your post has been deleted!')
    expect(page).not_to have_content('Cant think of anything to type')
  end
end
