require 'rails_helper'

feature 'commenting' do
  before do
    create(:user)
    authenticate_user
    create_post
  end

  scenario 'allows user to leave a comment on a post' do
    visit '/'
    click_link 'Comment'
    fill_in 'Message', with: 'I love it!'
    click_button 'Send'
    expect(current_path).to eq '/'
    expect(page).to have_content 'I love it!'
  end
end

def create_post
  visit '/'
  click_link 'Add Post'
  fill_in 'Description', with: 'My fantastic dinner'
  attach_file('Image', Rails.root + 'spec/support/fixtures/image-post.jpg')
  click_button 'Create Post'
end

def authenticate_user
  visit '/'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testing'
  click_button 'Log in'
end
