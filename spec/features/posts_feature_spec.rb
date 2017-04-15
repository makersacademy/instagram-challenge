require 'rails_helper'

feature 'posts' do

  context 'creating posts' do

    scenario 'signed in user can create a post' do
      user_sign_up
      add_new_post
      expect(page).to have_content 'Delicious home made food'
      expect(page).not_to have_content 'No posts yet'
    end

    scenario 'prompts visitor to sign up or in to create a post' do
      visit '/posts/new'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

  end

  context 'editing posts' do

    context 'user not signed in' do
      before do
        @post = Post.create(image:File.new('spec/helpers/indian_food.jpg'), description: 'delicious')
      end
      scenario 'link not available' do
        visit '/posts'
        expect(page).to have_content 'delicious'
        expect(page).not_to have_link 'Edit'
      end
    end

    context 'user signed but not creator' do
      before do
        user_sign_up
        @post = Post.create(image:File.new('spec/helpers/indian_food.jpg'), description: 'delicious')
      end
      scenario 'link not available' do
        visit '/posts'
        expect(page).to have_content 'delicious'
        expect(page).not_to have_link 'Edit'
      end
    end

    context 'user signed in' do
      before do
        user_sign_up
        add_new_post
      end

      scenario 'let creator edit a post' do
        visit '/posts'
        click_link 'Edit'
        attach_file('post_image', 'spec/helpers/indian_food.jpg')
        fill_in 'Description', with: 'Delicious home made indian food'
        click_button 'Update Post'
        expect(page).to have_content 'Delicious home made indian food'
        expect(page).not_to have_content 'Delicious home made food'
      end

    end

  end

  context 'deleting posts' do

    context 'user not signed in' do
      before do
        @post = Post.create(image:File.new('spec/helpers/indian_food.jpg'), description: 'delicious')
      end
      scenario 'link not available' do
        visit '/posts'
        expect(page).to have_content 'delicious'
        expect(page).not_to have_link 'Delete'
      end
    end

    context 'user signed in but not the creator' do
      before do
        user_sign_up
        @post = Post.create(image:File.new('spec/helpers/indian_food.jpg'), description: 'delicious')
      end
      scenario 'link not available' do
        visit '/posts'
        expect(page).to have_content 'delicious'
        expect(page).not_to have_link 'Delete'
      end
    end

    context 'user signed in' do
      before do
        user_sign_up
        add_new_post
      end

      scenario 'let creator delete a post' do
        visit '/posts'
        click_link 'Delete'
        expect(page).not_to have_content 'Delicious home made food'
        expect(page).not_to have_xpath("//img[contains(@src,'indian_food.jpg')]")
        expect(page).to have_content 'Post deleted successfully'
      end
    end
    end


end
