require 'rails_helper'
require 'web_helpers'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a link to add a post' do
      visit '/posts'
      expect(page).to have_content 'There are no posts yet!'
      expect(page).to have_link 'Create a post'
    end
  end


  context 'create posts' do
    scenario 'prompt user to fill out a form, then displays the new post' do
      upload_post
      expect(page).to have_css 'img'
      expect(page).to have_content 'Beautiful view'
      expect(page).to_not have_content 'There are no posts yet'
      expect(current_path).to eq '/posts'
    end
  end

end
