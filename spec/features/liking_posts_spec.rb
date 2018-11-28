require 'rails_helper'

feature 'liking posts' do
  background do
    user = create :user
    user_two = create(:user, id: 2, email: 'like@test.com', user_name: 'liketest')
    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: 2, caption: 'a post to like!')
    sign_in_with user
    visit '/'
  end
  scenario 'user can like another users post' do
    click_link 'like_1'
    expect(page).to have_css('div.liked-post')
    expect(find('.post-likers')).to have_content('testusername')
  end
  scenario 'user can unlike a post' do

  end
end
