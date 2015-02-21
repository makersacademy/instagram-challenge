require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    scenario 'should be able to post by filling in a form' do
      create_post
      expect(page).to have_content 'Cute kitten'
      expect(page).not_to have_content 'No posts'
      expect(Post.count).to eq 1
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:pic){ Post.create(picture:'spec/images/test_pic.jpeg', title: 'Cute kitten') }

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Picture'
      expect(page).to have_content 'Cute kitten'
      expect(current_path).to eq "/posts/#{pic.id}"
    end
  end

  context 'editing posts' do
    scenario 'let a user edit a restaurant' do
      create_post
      visit '/posts'
      click_link 'Picture'
      click_link 'Edit'
      attach_file 'post_picture', 'spec/images/test_pic.jpeg'
      fill_in 'post_title', with: 'Really cute kitten'
      click_button 'Update Post'
      expect(page).to have_content 'Really cute kitten'
      expect(current_path). to eq '/posts'
    end
  end

end
