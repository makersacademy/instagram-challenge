require 'rails_helper'
require 'helpers/users_helper_spec'
require 'helpers/posts_helper_spec'

feature 'comments' do

  include UsersHelper
  include PostsHelper

  before do
    sign_up('test@test.com', 'username', 'testpassword')
    create_post('Awesome', 'This is awesome')
    click_link 'Sign out'
  end

  context 'user not logged in' do
    scenario 'cannot like posts' do
      expect(page).not_to have_content('Like')
    end
  end

  context 'user logged in' do
    before do
      sign_in('username', 'testpassword')
    end

    scenario 'can like posts' do
      click_link 'Like'
      expect(page).to have_content 'Likes: 1'
    end

    scenario 'cannot like posts twice' do
      click_link 'Like'
      expect(page).not_to have_link 'Like'
    end

    scenario 'can unlike posts' do
      click_link 'Like'
      click_link 'Unlike'
      expect(page).to have_link 'Like'
      expect(page).to have content 'No likes'
    end

  end
end