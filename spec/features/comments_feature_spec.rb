require 'rails_helper'

feature 'comments' do
  before { Post.create description: 'Test post' }

  scenario 'let users leave comments, which are displayed under the post' do
    visit '/posts'
    fill_in 'comment_body', with: 'Test comment'
    click_button 'Comment'
    expect(page).to have_content 'Test comment'
  end
end
