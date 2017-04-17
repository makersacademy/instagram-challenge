require 'rails_helper'

feature 'Posts' do
  context 'when no posts have been added' do
    scenario 'shows users link to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts have been added')
      expect(page).to have_link('Add a post')
    end
  end

  context 'when posts have been created' do
    scenario 'displays posts' do
      create(:post)
      visit '/posts'
      expect(page).to have_content('#life')
      expect(page).not_to have_content('No posts have been added')
    end
  end

  context 'validations' do
    scenario 'raises error when user does not include image' do
      user = build(:user)
      sign_up_as(user)
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'Amazing!'
      click_button 'Upload'
      expect(page).to have_content("can't be blank")
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the posts' do
      user = build(:user)
      sign_up_as(user)
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: '#life'
      attach_file 'post[image]', 'spec/asset_spec/images/testing.png'
      click_button 'Upload'
      expect(page).to have_content('#life')
      expect(page).to have_css("img[src*='testing.png']")
      expect(current_path).to eq('/posts')
    end
  end


  context 'editing post captions' do
    before do
      user = build(:user)
      sign_up_as(user)

      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: '#life'
      attach_file 'post[image]', 'spec/asset_spec/images/testing.png'
      click_button 'Upload'
    end

    scenario 'creators can edit posts' do
      visit '/posts'
      click_link 'Edit Caption'
      fill_in 'Caption', with: 'London is amazing'
      click_button 'Update Post'
      expect(page).to have_content('London is amazing')
      expect(current_path).to eq('/posts')
    end

    scenario 'non-creator cannot edit posts' do
      click_link 'Sign out'
      user2 = build(:user, email: 'testing@testing.com', username: 'potato')
      sign_up_as(user2)
      visit '/posts'
      click_link 'Edit Caption'
      expect(page).to have_content('You can only edit posts you have created')
      expect(current_path).to eq('/posts')
    end
  end

  context 'deleting posts' do
    before do
      user = build(:user)
      sign_up_as(user)

      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: '#life'
      attach_file 'post[image]', 'spec/asset_spec/images/testing.png'
      click_button 'Upload'
    end

    scenario 'allows users to delete their posts if they are the creator' do
      visit '/posts'
      click_link 'Delete Post'
      expect(page).to have_content('Post deleted successfully')
      expect(page).not_to have_content('#life')
      expect(page).not_to have_css("img[src*='testing.png']")
    end

    scenario 'does not allow users to delete their posts if he/she is not the creator' do
      click_link 'Sign out'
      user2 = build(:user, email: 'testing@testing.com', username: 'potato')
      sign_up_as(user2)
      visit '/posts'
      click_link 'Delete Post'
      expect(page).to have_content('You can only delete posts you have created')
      expect(current_path).to eq('/posts')
    end
  end
end
