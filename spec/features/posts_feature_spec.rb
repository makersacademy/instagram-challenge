require 'rails_helper'

feature 'posts' do
  context 'when no photos have been posted' do
    scenario 'displays a message that there are no posts' do
      visit '/posts'
      expect(page).to have_content 'No posts yet...'
    end

    scenario 'displays a link to post a photo' do
      visit '/posts'
      expect(page).to have_link 'Post a photo'
    end
  end

  context 'when photos have been posted' do
    before do
      Post.create(description: 'Sample post', image_file_name: 'sample.jpg')
    end

    scenario 'displays posts' do
      visit '/posts'
      expect(page).to have_content 'Sample post'
      expect(page).not_to have_content 'No posts yet...'
    end
  end
end
