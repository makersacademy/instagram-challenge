require 'rails_helper'

feature 'posts' do

  context 'no posts available' do

    before do
      create(:user)
      authenticate_user
    end

    scenario 'should display a link to add a post' do
      visit ('/')
      expect(page).to have_content('No posts available')
      expect(page).to have_content('Add Post')
    end
  end

  context 'posts have been added' do
    before do
      create(:user)
      authenticate_user
      create_post
    end

    scenario 'display posts' do
      visit '/'
      expect(page).to have_content('My fantastic dinner')
      expect(page).not_to have_content('No posts available')
    end

    scenario 'display username' do
      visit '/'
      expect(page).to have_content('Posted by: testuser')
    end
  end

  context 'create posts' do
    before do
      create(:user)
      authenticate_user
    end

    scenario 'user fills a form to create a post and then displays the post' do
      create_post
      expect(page).to have_content 'My fantastic dinner'
      expect(page).to have_xpath("//img[contains(@src,'image-post.jpg')]")
      expect(current_path).to eq '/'
    end
  end

  context 'without image' do
    before do
      create(:user)
      authenticate_user
    end

    scenario 'does not allow user to create a post without image' do
      visit '/'
      click_link 'Add Post'
      click_button 'Create Post'
      expect(page).to have_content 'error'
    end
  end

end

def create_post
  visit '/'
  click_link 'Add Post'
  fill_in 'Description', with: 'My fantastic dinner'
  attach_file('Image', Rails.root + 'spec/support/fixtures/image-post.jpg')
  click_button 'Create Post'
end

def authenticate_user
  visit '/'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testing'
  click_button 'Log in'
end
