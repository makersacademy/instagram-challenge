require './spec/rails_helper'
require './spec/web_helpers.rb'

feature 'posts:' do

  before do
    user_login('alexa@gmail.com')
  end

  context 'no posts displayed on the page' do
    scenario 'should have option to add a post' do
      visit '/'
      expect(page).to have_content 'Listing posts'
      expect(page).to have_link 'New post'
      end
    end

  context 'posts are added' do
    scenario 'display the posts' do
      create_post
      expect(page).to have_content('Amazing day')
      expect(page).to have_link 'Show'
    end
  end

  context 'posts can be deleted' do
    scenario 'not display the deleted post' do
      create_post
      click_link 'Destroy'
      expect(page).not_to have_content('Amazing day')
    end
  end


  context 'posts can be shown' do
    scenario 'display the post details' do
      create_post
      click_link 'Show'
      expect(page).to have_content('Amazing day')
      expect(page).not_to have_content('Awful day')
      expect(page).to have_link 'Back'
    end
  end

  context 'can be created' do
    scenario 'fill in the form with the post description and upload image' do
      create_post
      click_link 'New post'
      fill_in 'post[description]', with: 'Sunny day'
      click_button 'Share'
      expect(page).to have_content 'Sunny day'
    end
  end

  context 'gives invalid post' do
    scenario 'does not let you submit a description that is less than 1 character' do
      visit '/posts'
      click_link 'New post'
      fill_in 'post[description]', with: ''
      click_button 'Share'
    expect(page).to have_content 'error'
    end
  end


end
