require 'rails_helper'

feature 'posts' do
  context 'no posts have been made' do
    scenario 'should display a prompt to make a post' do
      visit posts_path
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Make a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(text: 'Check out the hot new service CHRINSTAGRAM!!!')
    end

    scenario 'display posts' do
      visit posts_path
      expect(page).to have_content('Check out the hot new service CHRINSTAGRAM!!!')
      expect(page).not_to have_content('No posts yet')
    end
  end


  context 'making posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit posts_path
      click_link 'Make a post'
      fill_in 'Text', with: 'Check out the hot new service CHRINSTAGRAM!!!'
      click_button 'Create Post'
      expect(page).to have_content 'Check out the hot new service CHRINSTAGRAM!!!'
      expect(current_path).to eq posts_path
    end
  end

  context 'viewing posts' do

    let!(:first_post){Post.create(text:'Check out the hot new service CHRINSTAGRAM!!!')}

    scenario 'lets a user view a post' do
     visit posts_path
     click_link 'Check out the hot new service CHRINSTAGRAM!!!'
     expect(page).to have_content 'Check out the hot new service CHRINSTAGRAM!!!'
     expect(current_path).to eq post_path(first_post.id)
    end

  end

  context 'deleting posts' do

    before {Post.create text: 'Check out the hot new service CHRINSTAGRAM!!!'}

    scenario 'removes a post when a user clicks a delete link' do
      visit posts_path
      click_link 'Delete post'
      expect(page).not_to have_content 'Check out the hot new service CHRINSTAGRAM!!!'
      expect(page).to have_content 'Post deleted successfully'
    end

    scenario 'removes a post even when it has comments' do
      visit posts_path
      click_link "Reply to post: Check out the hot new service CHRINSTAGRAM!!!"
      fill_in "Text", with: "It's hot!"
      click_button 'Submit reply'
      click_link 'Delete post'
      expect(page).not_to have_content 'Check out the hot new service CHRINSTAGRAM!!!'
      expect(page).to have_content 'Post deleted successfully'
    end


  end
end
