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

    before { Post.create(title:'dog', description:'adorable').save(validate: false) }

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('dog')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do

    context 'Not signed in' do
      scenario 'does not allow user to create restaurant unless signed in' do
        visit '/posts'
        click_link 'Add a post'
        expect(page).to have_content 'You need to sign in or sign up before continuing'
        expect(page).not_to have_link 'Create Post'
      end
    end

    context 'signed in' do

      before do
        sign_up
      end

      scenario 'prompts user to fill out a form, then displays the new post' do
        visit '/posts'
        click_link 'Add a post'
        fill_in 'Title', with: 'dog'
        fill_in 'Description', with: 'adorable'
        click_button 'Create Post'
        expect(page).to have_content 'dog'
        expect(current_path).to eq '/posts'
      end

      context 'an invalid post' do
        it 'does not let you submit a comment that is too long' do
          description = 'This description is way too long, and so the validation should make this an invalid description and raise an error to notifying the user to shorten their description content to a maximum of 200 characters.'
          visit '/posts'
          click_link 'Add a post'
          fill_in 'Title', with: 'This title is way too long, it should raise an error'
          fill_in 'Description', with: description
          click_button 'Create Post'
          expect(page).to have_content 'Title is too long'
          expect(page).to have_content 'Description is too long'
        end
      end

    end

  end

  context 'viewing posts' do

    scenario 'lets a user view a post' do
      sign_up
      create_post
      visit '/posts'
      click_link 'dog'
      id = Post.first.id
      expect(page).to have_content 'adorable'
      expect(current_path).to eq "/posts/#{id}"
    end

  end

  context 'editing restaurants' do

    before do
      sign_up
      create_post
    end

    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit dog'
      fill_in 'Title', with: 'dog'
      fill_in 'Description', with: 'adorable'
      click_button 'Update Post'
      expect(page).to have_content 'dog'
      expect(page).to have_content 'adorable'
      expect(current_path).to eq '/posts'
    end

    scenario 'will not let a user edit a post they did not create' do
      click_link 'Sign out'
      sign_up(email: 'test@example.com')
      expect(page).not_to have_link 'Edit KFC'
    end

    scenario 'will not let a user edit a post if not signed in' do
      click_link 'Sign out'
      expect(page).not_to have_link 'Edit dog'
    end

  end

  context 'deleting posts' do

    before do
      sign_up
      create_post
    end

    scenario 'lets a user delete a post they created' do
      click_link 'Delete dog'
      expect(page).not_to have_content 'dog'
      expect(page).to have_content 'Post deleted successfully'
    end

    scenario 'will not let a user delete a restaurant they did not create' do
      click_link 'Sign out'
      sign_up(email: 'test@example.com')
      expect(page).not_to have_link 'Delete dog'
    end

    scenario 'will not let a user delete a restaurant if not signed in' do
      click_link 'Sign out'
      expect(page).not_to have_link 'Delete dog'
    end

  end
end
