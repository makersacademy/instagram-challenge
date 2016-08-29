require 'rails_helper'

feature 'Instagramclone posts' do
  context 'no posts yet' do
    scenario 'should display button for new posts' do
      visit '/posts'
      expect(page).to have_link 'New Post'
    end
  end
end

feature 'Post creation' do
  scenario 'create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('post_image', "spec/images/thumb.png")
    fill_in 'Caption', with: 'thumbs up #thumb'
    click_button 'Create Post'
    expect(page).to have_content('#thumb')
  end
end
