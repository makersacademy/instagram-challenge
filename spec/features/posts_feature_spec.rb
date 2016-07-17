require 'rails_helper'

feature 'posts' do
  context 'no posts have been posted' do
    scenario 'should display a prompt to post a picture' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Create a Post'
    end
  end

  context 'pictures have been added' do
    before do
      Post.create(title: 'Pug', description: 'cute')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('cute')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Create a Post'
      fill_in 'Title', with: 'Pug'
      fill_in 'Description', with: 'Cute'
      click_button 'Create Post'
      expect(page).to have_content 'Pug'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

  let!(:post){ Post.create(title: 'Pug', description: 'cute') }

  scenario 'lets a user view a post' do
    visit '/posts'
    click_link 'Pug'
    expect(page).to have_content 'cute'
    expect(current_path).to eq "/posts/#{post.id}"
  end

  end

  context 'editing restaurants' do

  before { Post.create(title: 'Pug', description: 'cute') }

  scenario 'let a user edit a post' do
    visit '/posts'
    click_link 'Edit Pug'
    fill_in 'Title', with: 'Puggle'
    fill_in 'Description', with: 'cuter'
    click_button 'Update Post'
    expect(page).to have_content 'Puggle'
    expect(page).to have_content 'cuter'
    expect(current_path).to eq '/posts'
  end

  end

  context 'deleting posts' do

  before { Post.create title: 'Pug', description: 'cute' }

  scenario 'removes a post when a user clicks a delete link' do
    visit '/posts'
    click_link 'Delete Pug'
    expect(page).not_to have_content 'Pug'
    expect(page).to have_content 'Post deleted successfully'
  end

  end

end
