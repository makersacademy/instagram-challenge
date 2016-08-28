require 'rails_helper'

feature 'posts' do

  context 'no posts have been made' do
    scenario 'should display a welcome and prompt to post' do
      visit '/posts'
      expect(page).to have_content "Welcome to BubHub."
      expect(page).to have_content "No posts yet"
      expect(page).to have_link 'post'
    end
  end

  context 'some posts have been made' do

    photo = File.new(Rails.root + 'spec/fixtures/test.png')

      before do
        Post.create(image: photo, caption: 'My first post')
      end

      scenario 'display posts' do

        visit '/posts'
        expect(page).to have_content('My first post')
        expect(page).not_to have_content "No posts yet"
      end
  end

  context 'posting to bubhub' do

    photo = File.new(Rails.root + 'spec/fixtures/test.png')

      scenario 'prompts user to upload their photo and add a caption, then displays it' do
        make_a_post
        expect(page).to have_content 'Should I take him to the doctor?'
        expect(current_path).to eq '/posts'
      end

      scenario 'throws an error when no photo is uploaded, and the user clicks post it' do
        visit '/posts'
        click_link 'post'
        fill_in 'Caption', with: 'Should I take him to the doctor?'
        click_button 'post it'
        expect(page).to have_content 'error'
      end

  end

  context 'deleting posts from bubhub' do
    scenario 'removes a post when a user clicks delete' do
      make_a_post
      click_link 'delete'
      expect(page).not_to have_content 'Should I take him to the doctor?'
    end
  end



end
