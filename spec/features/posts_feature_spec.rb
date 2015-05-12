require 'rails_helper'

feature 'posts' do
  context 'unregistered user' do
    before do
      Post.create(title: 'Funny', body: 'The most funny post in history')
    end

    scenario 'is able to view the most recent posts' do
      visit '/posts'
      expect(page).to have_content 'Funny'
      expect(page).to have_content 'The most funny post in history'
    end
  end
end
