require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add Post'
    end
  end

  context 'viewing posts' do

      scenario 'lets a user view a post' do
        signup
        add_post
        visit '/posts'
        find(".img-responsive").click
        expect(page).to have_content 'Some caption for the image goes here.'
      end

  end

  context 'posts have been added' do
    scenario 'display posts' do
      signup
      add_post
      visit '/posts'
      expect(page).to have_content('Some caption for the image goes here.')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating a post' do

    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      signup
      click_link 'Add Post'
      fill_in 'post_caption', with: 'Beautiful fabrics in India'
      page.attach_file('post[image]', Rails.root + 'spec/Fixtures/mumbaimarket.jpg')
      click_button 'submit'
      expect(page).to have_content 'Beautiful fabrics in India'
      expect(current_path).to eq '/posts'
    end

    scenario 'does not let you submit a post without an image' do
      visit '/posts'
      signup
      click_link 'Add Post'
      fill_in 'post_caption', with: 'Beautiful fabrics in India'
      # page.attach_file('post[image]', Rails.root + 'spec/Fixtures/mumbaimarket.pdf')
      click_button 'submit'
      expect(page).not_to have_content 'Beautiful fabrics in India'
      expect(page).to have_content 'error'
    end

  end

  context 'editing restaurants' do

    scenario 'let a user edit a post' do
      signup
      add_post
      click_link 'Edit'
      fill_in 'post_caption', with: 'Positano by night'
      click_button 'Update'
      expect(page).to have_content 'Positano by night'
      expect(page).not_to have_content 'Some caption for the image goes here.'
    end

  end

  context 'deleting restaurants' do

    scenario 'removes a post when a user clicks delete' do
      signup
      add_post
      click_link 'Delete'
      expect(page).not_to have_content 'Some caption for the image goes here.'
      expect(page).to have_content 'Post deleted successfully'
    end

  end



end
