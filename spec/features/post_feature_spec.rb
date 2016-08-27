require 'rails_helper'

feature 'posts' do

  context 'no posts have been made' do
    scenario 'should display a welcome and prompt to post' do
      visit '/posts'
      expect(page).to have_content "Welcome to BubHub. Please post a photo, and remember YOU ARE NOT GOING INSANE. YOU ARE JUST TIRED."
      expect(page).to have_content "No posts yet"
      expect(page).to have_link 'post'
    end
  end

  context 'some posts have been made' do
    before do
      Post.create(caption: 'My first post')
    end

    scenario 'display posts' do

      visit '/posts'
      expect(page).to have_content('My first post')
      expect(page).not_to have_content "No posts yet"
    end
  end

  context 'posting to bubhub' do
    scenario 'prompts user to upload their photo and add a caption, then displays it' do
      visit '/posts'
      click_link 'post'
      fill_in 'Caption', with: 'Should I take him to the doctor?'
      click_button 'post it'
      expect(page).to have_content 'Should I take him to the doctor?'
      expect(current_path).to eq '/posts'
    end
  end

end
