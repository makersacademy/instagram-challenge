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
      Post.create(caption: 'Birthday')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content ('Birthday')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'creating posts' do
    scenario 'promts a user to add a post then displays the post' do |variable|
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'Birthday'
      click_button 'Create Post'
      expect(page).to have_content 'Birthday'
      expect(current_path).to eq '/posts'
    end
  end

end
