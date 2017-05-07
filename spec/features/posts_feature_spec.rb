require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'Should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(image: 'https://placebear.com/200/300')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_css("img[src*='https://placebear.com/200/300']")
      expect(page).not_to have_content 'No posts yet'
    end
  end

  context 'creating posts' do
    before do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Image Url', with: 'https://placebear.com/200/300'
      click_button 'Create Post'
    end

    scenario 'Prompts user to enter an image url' do
      expect(page).to have_css("img[src*='https://placebear.com/200/300']")
      expect(current_path).to eq '/posts'
    end
  end

  context 'liking posts' do
    before do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Image Url', with: 'https://placebear.com/200/300'
      click_button 'Create Post'
    end

    scenario 'Likes do not display if zero' do
      expect(page).not_to have_content(0)
      expect(current_path).to eq '/posts'
    end

    # scenario 'After two likes, likes display on index' do
    #   click_link 'Like post'
    #   expect(page).to have_content("1 like")
    #   expect(current_path).to eq '/posts'
    # end
  end
end
