require 'rails_helper'

feature 'comments' do
  context 'user not signed in' do
    before do
      thePost = Post.create(title: 'Funny', body: 'The most funny post in history')
      thePost.comments.create(body: 'I cannot stop laughing')
    end

    scenario 'is able to view the most recent posts' do
      visit '/posts'
      expect(page).to have_content 'Funny'
      expect(page).to have_content 'The most funny post in history'
      expect(page).to have_content 'I cannot stop laughing'
    end
  end
end
