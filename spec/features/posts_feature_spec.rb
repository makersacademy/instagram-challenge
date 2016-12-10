require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/posts'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'not logged in' do
  scenario 'can\'t create a post when logged out' do
    visit '/posts'
    click_link 'Add an image'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
    expect(current_path).to eq '/users/sign_in'
  end
end

  context 'image has been added' do
    scenario 'displays posts' do
      sign_up
      create_post
      visit '/posts'
      expect(page).to have_content 'Sunny Day'
      expect(page).to_not have_content 'No images yet'
    end
  end

  context 'creating posts' do
    scenario 'prompts the user to fill out a form then displays the image title' do
      visit '/posts'
      sign_up
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
        sign_up
        click_link 'Add an image'
        fill_in 'Title', with: 'Su'
        click_button 'Post Image'
        expect(page).not_to have_css 'h2', text: 'Su'
        expect(page).to have_content 'error'
      end
    end
  end

  context 'viewing posts' do
    scenario 'lets a user view an image' do
      sign_up
      create_post
      visit '/posts'
      click_link 'Sunny Day'
      expect(page).to have_content 'At the park'
      expect(current_path).to eq post_path(Post.last)

    end
  end

  context 'editing posts' do
    scenario 'lets a user edit a post' do
      sign_up
      create_post
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

    scenario 'cant edit a post when logged out' do
       visit '/posts'
       sign_up
       create_post
       click_link('Sign out')
       click_link('Sunny Day')
       click_link 'Edit Sunny Day'
       expect(page).to have_content 'You need to sign in or sign up before continuing'
       expect(current_path).to eq '/users/sign_in'
     end

     scenario 'user cannot edit another users post' do
      visit '/posts'
      sign_up
      create_post
      click_link('Sign out')
      sign_up_2
      click_link('Sunny Day')
      click_link('Edit Sunny Day')
      expect(page).to have_content 'Can only edit your own posts'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do
    scenario 'removes a post when a user clicks a delete link' do
      sign_up
      create_post
      visit '/posts'
      click_link 'Sunny Day'
      click_link 'Delete Sunny Day'
      expect(page).not_to have_content 'Sunny Day'
      expect(page).to have_content 'Post deleted successfully'
    end

    scenario 'cant delete a post when logged out' do
      visit '/posts'
      sign_up
      create_post
      click_link('Sign out')
      click_link('Sunny Day')
      click_link 'Delete Sunny Day'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
      expect(current_path).to eq '/users/sign_in'
    end

    scenario 'user cannot delete another users post' do
      visit '/posts'
      sign_up
      create_post
      click_link('Sign out')
      sign_up_2
      click_link('Sunny Day')
      click_link 'Delete Sunny Day'
      expect(page).to have_content 'Can only delete your own posts'
      expect(current_path).to eq '/posts'
    end
  end
end
