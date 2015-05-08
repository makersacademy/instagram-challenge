require 'rails_helper'

feature 'Post' do
  context 'There are no posts until a first one has been created' do
    scenario 'There is a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts yet :-(')
      expect(page).to have_link('add a post!')
    end
  end

  context 'Posts that have been created are viewable at the /posts link' do
    # create a post in the database
    before { Post.create(content: 'its a post', time:(Time.now.strftime("%y:%b:%d:%H:%M:%S")))}
    
    scenario 'Posts are displayed' do
      visit '/posts'
      expect(page).to have_content('its a post')
      expect(page).to have_content(Time.now.strftime("%y:%b:%d:%H:%M:%S"))
    end
  end

  # context 'A post can be made on the site' do
  #   scenario 'When the user fills out the post form, the post is now displayed' do
  #     visit 'posts'
  #     click_link 'add a post!'
  #     fill_in :content, with: 
  #   end
  # end
end