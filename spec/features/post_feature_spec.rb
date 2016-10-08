require 'rails_helper'

feature 'posts' do

  context 'no posts should have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(caption: 'Oh look, a cat!')
    end

    scenario 'should display post' do
      visit '/posts'
      expect(page).to have_content 'Oh look, a cat!'
      expect(page).not_to have_content 'No posts yet'
    end
  end

  context 'creating posts' do
    scenario 'users can create posts through form' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'Oh look, a cat!'
      page.attach_file('post_image', Rails.root + 'public/images/cat.jpg')
      click_button 'Add'
      expect(page).to have_content 'Oh look, a cat!'
      expect(page).to have_css "img[src*='cat']"
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:post){ Post.create(caption:'Oh look, a cat!')}

    scenario 'users can view an individual post' do
      visit '/posts'
      click_link 'Oh look, a cat'
      expect(page).to have_content 'Oh look, a cat!'
      expect(current_path).to eq "/posts/#{post.id}"
    end
  end

end
