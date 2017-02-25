require 'rails_helper'

feature 'commenting' do
  before { Post.create(description: 'my lovely photo', id: 1) }

  scenario 'a user can comment on a post' do
    visit('/posts')
    click_link('my lovely photo')
    click_link('leave comment')
    fill_in 'Comment', with: 'What a bloody lovely photo'
    click_button('Leave Comment')
    expect(current_path).to eq('/posts/1')
    expect(page).to have_content('What a bloody lovely photo')
  end

end
