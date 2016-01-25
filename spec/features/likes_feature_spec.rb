require 'rails_helper'

feature 'social validation' do
  before do
    visit '/'
    sign_up
    birthday = Post.create(caption: 'birthday')
    birthday.comments.create(comment: 'it was a great day!')
  end

  scenario 'a user can like a post, updating the like count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content("1 likes")
  end

end
