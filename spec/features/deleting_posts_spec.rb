require 'rails_helper'

feature 'Deleting posts' do
  background do
    visit '/'
    click_link 'Sign Up'
    sign_up
    post = create(:post, caption: 'Cant think of anything to type')
    visit '/'

    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_css("img[src*='monkey']")
    find(:xpath, "//a/img[@alt='Monkey']/..").click
    click_link 'Edit Post'
  end

  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Your post has been deleted!')
    expect(page).not_to have_content('Cant think of anything to type')
  end
end
