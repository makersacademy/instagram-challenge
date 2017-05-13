require 'rails_helper'

feature 'no posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

feature 'posts' do
  before do
    visit '/posts'
    click_link 'Add a post'
    page.attach_file('Image', Rails.root + "app/assets/images/andromeda.jpg")
    fill_in 'Name', with: 'Andromeda'
    click_button 'Post image'
  end

  context 'posts have been added' do
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content 'Andromeda'
      expect(page).not_to have_content 'No posts yet'
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      expect(page).to have_content 'Andromeda'
      expect(page).to have_css 'img'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do
    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Andromeda'
      expect(page).to have_content 'Andromeda'
      expect(current_path).to eq "/posts/#{Post.last.id}"
    end
  end

  context 'deleting posts' do
    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'Andromeda'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end


end
