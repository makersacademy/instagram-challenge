require 'rails_helper'

feature 'Posts feature' do

  context 'creating posts' do

    before do
      visit('/')
      sign_up_user
    end

    scenario 'then displays the new post and username of author' do
      create_post
      visit('/')
      expect(page).to have_content('test')
      expect(page).to have_content('First post')
      expect(page).to have_css("img[src*='first.jpg']")
    end

    scenario 'not saving new post without image' do
      create_post(image_path: nil, caption: 'First post')
      click_button 'Create Post'
      expect(page).not_to have_content('First post')
      expect(page).to have_content 'error'
    end

  end

  context 'viewing/ editing/ deleting posts' do
    let!(:user){create_user}
    let!(:user1) do
      create_user(
        username: 'test1',
        email: 'test1@example.com'
      )
    end

    let!(:post1) do
      add_existing_post(user_id: user.id)
    end

    let!(:post2) do
      add_existing_post(
        path: '/spec/files/images/second.jpg',
        caption: 'Second post',
        user_id: user.id
      )
    end

    scenario 'let a user view posts only if logged in' do
      visit '/'
      expect(page).not_to have_content('First post')
      expect(page).to have_content('You need to Log in to see posts!')
      log_in_user
      expect(page).not_to have_content('You need to Log in to see posts!')
      expect(page).to have_content('First post')
      expect(page).to have_content ('Second post')
    end

    scenario 'let a user view individual post' do
      visit '/'
      log_in_user
      click_link 'View First post'
      expect(page).to have_content 'First post'
      expect(page.current_path).to eq(post_path(post1))
    end

    scenario 'let a user edit only his posts' do
      visit '/'
      log_in_user(email: 'test1@example.com')
      click_link 'View First post'
      expect(page).not_to have_content 'Edit'
      click_link('Sign out')
      log_in_user
      click_link 'View First post'
      click_link 'Edit'
      fill_in 'Caption', with: 'First POST'
      click_button 'Update Post'
      expect(page).to have_content 'First POST'
      expect(current_path).to eq(post_path(post1))
    end

    scenario 'not saving updates for post without image' do
      visit('/')
      log_in_user
      click_link 'View First post'
      click_link 'Edit'
      fill_in 'Caption', with: 'Something new.'
      attach_file('Image',"spec/files/images/first.txt")
      click_button 'Update Post'
      expect(page).not_to have_content('Something new.')
      expect(page).to have_content 'error'
    end

    scenario 'delete a post when user press Delete button' do
      visit '/'
      log_in_user
      click_link 'View First post'
      click_link 'Edit'
      click_link 'Delete'
      expect(current_path).to eq('/')
      expect(page).to have_content 'Post deleted successfully'
      expect(page).not_to have_content 'First post'
    end

  end

end
