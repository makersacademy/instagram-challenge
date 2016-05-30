require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/posts'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'image has been added' do
    before do
      Post.create(title: 'Sunny day', description: 'At the park')
    end

    scenario 'displays posts' do
      visit '/posts'
      expect(page).to have_content 'Sunny day'
      expect(page).to_not have_content 'No images yet'
    end
  end

  context 'creating posts' do
    scenario 'prompts the user to fill out a form then displays the image title' do
      visit '/posts'
      click_link 'Add an image'
      fill_in 'Title', with: 'Sunny day'
      fill_in 'Description', with: 'At the park'
      click_button 'Post Image'
      expect(page).to have_content 'Sunny day'
      expect(current_path).to eq '/posts'
    end

    context 'an invalid post' do
      it 'does not let you submit a name that is too short' do
        visit '/posts'
        click_link 'Add an image'
        fill_in 'Title', with: 'Su'
        click_button 'Post Image'
        expect(page).not_to have_css 'h2', text: 'Su'
        expect(page).to have_content 'error'
      end
    end
  end

  context 'viewing posts' do
    let!(:sun) {Post.create(title: 'Sunny day', description: 'At the park')}

    scenario 'lets a user view an image' do
      visit '/posts'
      click_link 'Sunny day'
      expect(page).to have_content 'At the park'
      expect(current_path).to eq "/posts/#{sun.id}"

    end
  end

  context 'editing posts' do
    before {Post.create title: 'Sunny Day', description: 'At the park'}

    scenario 'lets a user edit a post' do
      visit '/posts'
      click_link 'Sunny Day'
      click_link 'Edit Sunny Day'
      fill_in 'Title', with: 'Rainy Day'
      fill_in 'Description', with: 'At home'
      click_button 'Update Post'
      expect(page).to have_content 'Rainy Day'
      expect(page).to have_content 'At home'
      expect(current_path).to eq post_path(Post.last)
    end
  end

  context 'deleting posts' do
    before {Post.create title: 'Sunny Day', description: 'At the park'}

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Sunny Day'
      click_link 'Delete Sunny Day'
      expect(page).not_to have_content 'Sunny Day'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
