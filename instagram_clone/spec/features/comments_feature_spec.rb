require 'rails_helper'

feature 'Leaving a comment' do
  scenario 'allows users to leave a comment' do
    post = Post.create(content: 'its a post')
    visit '/posts'
    click_link "post ##{post.id}"
    click_link "comment on post"
    fill_in :Thoughts, with: "Yeah buddy!!!"
    click_button 'leave comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content "Yeah buddy!!!"
  end

end