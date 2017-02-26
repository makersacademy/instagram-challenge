require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a posts' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      @user = User.create(email: 'ben@ben.com', password: 'ben123')
      @posts = Post.create(description: 'Holiday', user: @user)
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Holiday')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      signup_and_in
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Description', with: 'Holiday'
      click_button 'Post'
      expect(page).to have_content 'Holiday'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do
    before do
      @user = User.create(email: 'ben@ben.com', password: 'ben123')
      @posts = Post.create(description: 'Holiday', user: @user)
    end

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Holiday'
      expect(page).to have_content 'Holiday'
      expect(current_path).to eq "/posts/#{@posts.id}"
    end
  end

  context 'deleting posts' do
    before do
      user = User.create(email: 'test@example.com', password: 'test123')
      post = Post.create(description: 'Holiday', user: user)
      sign_in
    end

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete Holiday'
      expect(page).not_to have_content 'Holiday'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
