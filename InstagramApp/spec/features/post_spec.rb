require 'rails_helper'

feature 'Post' do
  context 'Visit homepage' do
    scenario 'It should display a link to add post' do
      visit '/posts'
      expect(page).to have_content "No post added yet"
      expect(page).to have_link "Add post"
    end
  end

  context 'posts have been added' do
    before do
      Post.create(title:'POST1')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('POST1')
      expect(page).not_to have_content('No post added yet')
    end
  end

  context 'creating posts' do
  scenario 'prompts user to fill out a form, then displays the new post' do
    sign_up
    click_link 'Add post'
    fill_in 'Title', with: 'POST1'
    click_button 'Create Post'
    expect(page).to have_content 'POST1'
    expect(current_path).to eq '/posts'
  end
end
  context 'viewing posts' do
    let!(:post){ Post.create(title:'POST1') }
    scenario 'lets a user view a post' do
     visit '/posts'
     sign_up
     click_link 'View Post'
     expect(page).to have_content 'POST1'
     expect(current_path).to eq "/posts/#{post.id}"
    end
  end

  context 'editing post' do
  before { Post.create title: 'POST1', content: 'Week1 post', id: 1 }
    scenario 'let a user edit a post' do
      visit '/posts'
      sign_up
      click_link 'Edit Post'
      fill_in 'Title', with: 'POST2'
      fill_in 'Content', with: 'Week2 post'
      click_button 'Update Post'
      expect(page).to have_content 'POST2'
      visit '/posts/1'
      expect(page).to have_content 'Week2 post'
      expect(current_path).to eq '/posts/1'
    end
  end
  context 'deleting post' do

  before { Post.create title: 'Post1', content: 'Week1 post' }

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      sign_up
      click_link 'Delete Post'
      expect(page).not_to have_content 'POST1'
      expect(page).to have_content 'Post deleted successfully'
    end

end
end
