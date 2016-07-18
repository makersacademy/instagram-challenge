require 'rails_helper'

feature 'Deleting posts' do
  before do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, caption: 'Happy days.')
    login_as(user, scope: :user)
    visit edit_post_path(post)
  end

  scenario 'Can delete a single post' do
    click_link 'Delete Post'
    expect(page).to_not have_content('Happy days.')
  end
end
