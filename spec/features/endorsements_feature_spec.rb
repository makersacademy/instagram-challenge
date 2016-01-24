require 'rails_helper'

feature 'social validation' do
  before do
    birthday = Post.create(caption: 'birthday')
    birthday.comments.create(comment: 'it was a great day!')
  end

  scenario 'a user can like a post, updating the like count' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end
