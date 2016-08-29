require 'rails_helper'

feature 'Comments' do
  background do
    post = create(:post)
  end

  scenario 'allows users to leave a comments using a form' do
     visit '/'
     click_link 'Review KFC'
     fill_in "Comment", with: "Looking good!"
     click_button 'Post Comment'
     expect(current_path).to eq '/#{post.id}'
     expect(page).to have_content "Looking good!"
  end

end
