require 'rails_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    login_as(user, scope: :user)
    visit post_path(post)
    expect(page.current_path).to eq(post_path(post))
  end
end
