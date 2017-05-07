require 'rails_helper'

feature 'liking posts' do
  before { Post.create description: "Nice", image:  File.open("#{Rails.root}/spec/fixtures/cat.png"), user: User.create(       username: 'cat',
                                          email: 'cat@meow.com',
                                          password: 'meowmeow',
                                          password_confirmation: 'meowmeow')}

  scenario 'a user can like a post, which updates the like count', js: true do
    visit posts_path
    sign_up('pixel@bmo.com')
    click_link('Like')
    expect(page).to have_content('1 like')
  end

  scenario 'a user can remove a like, which will decrease like count', js: true do
    visit posts_path
    sign_up('meow@cat.com')
    click_link('Like')
    visit current_path
    click_link('Like')
    expect(page).to have_content('0 like')
  end

  scenario 'a post can have multiple likes', js: true do
    visit posts_path
    sign_up('meow@cat.com')
    click_link('Like')
    click_link('Sign out')
    visit current_path
    click_link('Sign up')
    fill_in 'Username', with: "bmo"
    fill_in 'Email', with: 'spicy@cat.com'
    fill_in 'Password', with: 'catcat'
    fill_in 'Password confirmation', with: 'catcat'
    click_button('Sign up')
    visit posts_path
    click_link('Like')
    visit current_path
    expect(page).to have_content('2 like')
  end
end
