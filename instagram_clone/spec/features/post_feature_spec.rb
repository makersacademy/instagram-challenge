require 'rails_helper'

feature 'Posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts have been added yet'
      expect(page).to have_link 'New Post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(location: 'London')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('London')
      expect(page).not_to have_content('No posts have been added yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to add a new post, then displays the new post' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Description', with: 'rainy day'
      click_button 'Create Post'
      expect(page).to have_content 'rainy day'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:berlin){ Post.create(location:'Berlin') }

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Show'
      expect(page).to have_content 'Berlin'
      expect(current_path).to eq "/posts/#{berlin.id}"
    end
  end

  context 'editing posts' do

    before { Post.create location: 'Rye', description: 'Gorgeous place!', id: 1 }
    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit'
      fill_in 'Description', with: 'Gorgeous place! Can\'t wait to go back...'
      click_button 'Update Post'
      expect(page).to have_content 'Rye'
      expect(page).to have_content 'Gorgeous place! Can\'t wait to go back...'
      expect(current_path).to eq '/posts/1'
    end
  end

  context 'deleting posts' do

    before { Post.create location: 'Rye', description: 'Gorgeous place!', id: 1 }

    scenario 'removes a post when a user clicks a destroy link', :js => true do
      visit '/posts'
      click_link 'Destroy'
      page.driver.browser.switch_to.alert.accept
      expect(page).not_to have_content 'Rye'
      expect(page).to have_content 'Post was successfully destroyed'
    end
  end
end
