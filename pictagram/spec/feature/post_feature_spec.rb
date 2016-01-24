require 'rails_helper'

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
      Post.create(comment: 'My first post')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('My first post')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'post[comment]', with: 'My Fave Breakfast!'
      click_button 'Create Post'
      expect(page).to have_content 'My Fave Breakfast!'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:yummy){Post.create(comment:'yummy')}

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'yummy'
      expect(page).to have_content 'yummy'
      expect(current_path).to eq "/posts/#{yummy.id}"
    end

  end

  context 'editing posts' do

    before { Post.create comment: 'sunset!' }

    scenario 'let a user edit a post' do
     visit '/posts'
     click_link 'Edit sunset!'
     fill_in 'post[comment]', with: 'sunrise!'
     click_button 'Update Post'
     expect(page).to have_content 'sunrise!'
     expect(current_path).to eq '/posts'
    end

  end

  context 'deleting posts' do

    before {Post.create comment: 'fun!'}

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete fun!'
      expect(page).not_to have_content 'fun!'
      expect(page).to have_content 'Post deleted successfully'
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end

end
