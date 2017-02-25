require 'rails_helper'
require 'web_helper'

feature 'commenting' do

  scenario 'a user can comment on a post' do
    create_user
    create_post
    sign_in
    visit('/posts')
    click_link('My lovely photo')
    click_link('leave comment')
    fill_in 'Comment', with: 'What a bloody lovely photo'
    click_button('Leave Comment')
    expect(current_path).to eq('/posts/1')
    expect(page).to have_content('What a bloody lovely photo')
  end

  scenario 'a user cannot leave an empty comment' do
    create_user
    create_post
    sign_in
    visit('/posts')
    click_link('My lovely photo')
    click_link('leave comment')
    fill_in 'Comment', with: ''
    click_button('Leave Comment')
    expect(page).to have_content('error')
  end

end
