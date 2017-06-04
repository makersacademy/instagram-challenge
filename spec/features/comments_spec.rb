require 'rails_helper'

RSpec.feature 'Posts can be commented on and comments are displayed', type: :feature do
  let(:user) {
    User.create(name: "Admin", username: "MrAdmin", email: "test@example.com", password: "password")
  }

  scenario 'User can see comments' do
    sign_up
    user_makes_post
    fill_in 'comment[body]', with: 'This is a great comment'
    find('#comment-submit').click
    expect(page).to have_current_path('/posts')
    expect(page).to have_content('This is a great comment')
  end

  scenario 'User can see name next to comments' do
    sign_up
    user_makes_post
    fill_in 'comment[body]', with: 'This is a super comment'
    find('#comment-submit').click
    expect(page).to have_current_path('/posts')
    expect(page).to have_content('MrAdmin: This is a super comment')
  end
end
