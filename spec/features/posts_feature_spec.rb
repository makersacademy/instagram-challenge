require 'rails_helper'
require 'web_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(message: 'This is my first post!')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('This is my first post!')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do

    scenario 'prompts user to fill out a form, then displays the new post' do
      sign_up('john')
      create_post
      expect(page).to have_content 'This is my first real message'
      expect(current_path).to eq '/posts'
    end
    scenario 'shows date of post' do
      sign_up('john')
      create_post
      expect(page).to have_content DateTime.now.strftime('%m/%d/%Y')
      expect(page).to have_content DateTime.now.strftime('%I:%M%p')
    end
  end

  context 'viewing posts' do

    let!(:post1){Post.create(message: 'Hello world!')}

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Hello world!'
      expect(page).to have_content 'Hello world!'
      expect(page).to have_content "Posted at #{DateTime.now.strftime('%I:%M%p, %m/%d/%Y')}"
      expect(current_path).to eq "/posts/#{post1.id}"
    end
  end

  context 'editing posts' do

    scenario 'let a user edit a post' do
      sign_up('john')
      create_post
      visit '/posts'
      click_link 'Edit post'
      fill_in 'Message', with: 'Goodbye World'
      click_button 'Update Post'
      expect(page).to have_content 'Goodbye World'
      expect(current_path).to eq '/posts'
    end

    scenario 'user cannot edit another users post' do
      sign_up('john')
      create_post
      click_link 'Sign out'
      sign_up('steve')
      click_link 'Edit post'
      expect(page).to have_content('Cannot edit post belonging to another user')
    end

  end

  context 'deleting posts' do

    scenario 'removes a post when a user clicks a delete post' do
      sign_up('steve')
      create_post
      click_link 'Delete post'
      expect(page).not_to have_content 'Look at my cat'
      expect(page).to have_content 'Post deleted successfully'
    end
  end

  scenario 'users must be signed in to post a message' do
    visit '/posts'
    click_link 'Add a post'
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end


  scenario 'user cannot delete another users post' do
    sign_up('john')
    create_post
    click_link 'Sign out'
    sign_up('steve')
    click_link 'Delete post'
    expect(page).to have_content('Cannot delete post belonging to another user')
  end
end
