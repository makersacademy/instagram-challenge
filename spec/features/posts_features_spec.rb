require 'rails_helper'
require_relative '../web_helper'

feature 'posts' do
    context 'no posts should have been added' do
        scenario 'should display a prompt to add a post' do
            visit '/posts'
            expect(page).to have_content 'No posts yet'
            expect(page).to have_link 'Add a post'
        end
    end
    context 'posts have been added' do
        scenario 'display posts' do
            sign_up
            add_post('Nice Picture', 'post.png')
            expect(page).to have_content('Nice Picture')
            expect(page).not_to have_content('No posts yet')
        end
    end
    context 'creating posts' do
        scenario 'prompts user to fill out a form, then displays the new post' do
            sign_up
            add_post('Nice Picture', 'post.png')
            expect(page).to have_content('Nice Picture')
            expect(page).to have_css "img[src*='post']"
            expect(current_path).to eq '/posts'
        end
    end
    context 'uploading a picture' do
        scenario 'user can add a picture to the post' do
            sign_up
            add_post('Nice Picture', 'post.png')
            expect(page).to have_content('Nice Picture')
            expect(page).to have_css "img[src*='post']"
            expect(current_path).to eq '/posts'
        end
    end
    context 'diaplay posts' do
        scenario 'users can display a post in a different page' do
            sign_up
            add_post('Nice Picture', 'post.png')
            find("img[src*='post']").click
            expect(page).to have_content 'Nice Picture'
            expect(page).to have_css "img[src*='post']"
            expect(current_path).to eq '/posts'
        end
    end
    context 'editing posts' do
        scenario 'let a user edit a post' do
            sign_up
            add_post('Nice Picture', 'post.png')
            edit_post('Bahh not at all')
            expect(page).to have_content 'Bahh not at all'
            expect(page).not_to have_content 'Nice Picture'
            expect(current_path).to eq '/posts'
        end
    end
    context 'deleting posts' do
      scenario 'users can delete a post' do
         sign_up
         add_post('Nice Picture', 'post.png')
         click_link 'Delete'
         expect(page).to have_content 'Post deleted successfully'
         expect(page).not_to have_content 'Nice Picture'
         expect(page).not_to have_css "img[src*='post']"
       end
     end
end
