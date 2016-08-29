require 'rails_helper'

feature 'liking posts' do
  before do
    user = User.create(email: 'test@test.com', password: 'testtest')
    post = Post.create(caption: 'Sunset', user_id: user.id )
  end

  scenario 'a user can like a post, which increases the post like count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end
