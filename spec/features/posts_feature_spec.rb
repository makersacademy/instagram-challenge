require 'rails_helper'

feature 'posts' do
  scenario 'display a link to post a photo' do
    visit '/posts'
    expect(page).to have_link 'Post a photo'
  end

  context 'if no photos have been posted' do
    scenario 'display a message that there are no posts' do
      visit '/posts'
      expect(page).to have_content 'No posts yet...'
    end
  end

  context 'if photos have been posted' do
    before do
      Post.create(description: 'Sample post', image_file_name: 'sample.jpg')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content 'Sample post'
      expect(page).not_to have_content 'No posts yet...'
    end
  end

  context 'posting a photo' do
    scenario 'display a form to fill out, then display the post' do
      visit '/posts'
      click_link 'Post a photo'
      fill_in 'Description', with: 'Sample post'
      click_button 'Post'
      expect(page).to have_content 'Sample post'
    end
  end
end
