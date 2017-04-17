require 'rails_helper'

feature 'Deleting posts' do
  background do
    user = create(:user)
    visit '/'
    click_link 'Sign In'
    sign_in(user)
    # post = create( :post, user_id = user.id )
    post = create(:post, caption: 'Cant think of anything to type',
                         user_id: user.id)
    visit '/'

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
