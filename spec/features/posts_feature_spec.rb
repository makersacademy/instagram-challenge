require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do

    scenario 'should display a prompt to add post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end

  end


  context 'creating posts' do
    before do
      add_new_post
    end

    scenario 'display posts' do
      expect(page).to have_content 'Delicious home made food'
      expect(page).not_to have_content 'No posts yet'
    end

  end

  context 'editing posts' do
    before do
      add_new_post
    end

    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit'
      attach_file('post_image', File.absolute_path('/Users/ashwinimani/Pictures/indian_food.jpg'))
      fill_in 'Description', with: 'Delicious home made indian food'
      click_button 'Update Post'
      expect(page).to have_content 'Delicious home made indian food'
      expect(page).not_to have_content 'Delicious home made food'
    end

  end

  context 'deleting posts' do
    before do
      add_new_post
    end

    scenario 'let user edit a post' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'Delicious home made food'
      expect(page).not_to have_xpath("//img[contains(@src,'indian_food.jpg')]")
      expect(page).to have_content 'Post deleted successfully'
    end
  end

end
