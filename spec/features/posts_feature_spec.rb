require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do

    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'There are no posts yet'
      expect(page).to have_link 'Add a post'
    end

  end

  context 'posts have been added' do
    before { Post.create description: 'Awesome latte' }

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Awesome latte')
      expect(page).not_to have_content('There are no posts yet')
    end

  end

  context 'creating posts' do

    scenario 'prompts user to add content, then displays the new post' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'Add a post'
      attach_file('post[image]', 'spec/features/holiday.jpg')
      fill_in 'Description', with: 'Lazy day'
      click_button 'Post'
      expect(page).to have_content 'Lazy day'
      expect(page).to have_css 'img'
      expect(current_path).to eq '/posts'
    end

    scenario 'prevents a user posting if they are not logged in' do
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario 'an invalid post description' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'Add a post'
      attach_file('post[image]', 'spec/features/holiday.jpg')
      fill_in 'Description', with: 'X'
      click_button 'Post'
      expect(page).not_to have_css 'h2', text: 'X'
      expect(page).to have_content 'error'
    end

  end

  context 'editing posts' do

    scenario 'lets a user edit a post description' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'Add a post'
      attach_file('post[image]', 'spec/features/holiday.jpg')
      fill_in 'Description', with: 'Lazy day'
      click_button 'Post'
      click_link 'Edit post'
      fill_in 'Description', with: 'Super lazy day'
      click_button 'Update Post'
      expect(page).to have_content 'Super lazy day'
      expect(current_path).to eq '/posts'
    end

    scenario 'prevents a user editing a post that is not theirs' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'Add a post'
      attach_file('post[image]', 'spec/features/holiday.jpg')
      fill_in 'Description', with: 'Lazy day'
      click_button 'Post'
      click_link 'Sign out'
      sign_up('steph@test.com', 'stephtest', 'stephtest')
      expect(page).not_to have_link 'Edit post'
    end

  end

  context 'deleting posts' do

    scenario 'lets a user delete a post' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'Add a post'
      attach_file('post[image]', 'spec/features/holiday.jpg')
      fill_in 'Description', with: 'Lazy day'
      click_button 'Post'
      click_link 'Delete post'
      expect(page).not_to have_content 'Lazy day'
      expect(page).not_to have_css 'img'
      expect(page).to have_content 'Post deleted successfully'
    end

    scenario 'prevents a user editing a post that is not theirs' do
      sign_up('test@test.com', 'testtest', 'testtest')
      click_link 'Add a post'
      attach_file('post[image]', 'spec/features/holiday.jpg')
      fill_in 'Description', with: 'Lazy day'
      click_button 'Post'
      click_link 'Sign out'
      sign_up('steph@test.com', 'stephtest', 'stephtest')
      expect(page).not_to have_link 'Delete post'
    end

  end

end

def sign_up(email, password, password_confirmation)
  visit '/users/sign_up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end