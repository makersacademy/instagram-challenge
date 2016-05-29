require 'rails_helper'

feature 'posts' do

  after do
    remove_uploaded_file
  end

  context 'no posts have been added' do
    scenario 'should display a prompt to upload a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post to instagram'
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      create_post
      expect(page).to have_content 'My first post'
      expect(page).to have_css("img[src*='test.png']")
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

  scenario 'lets a user view a post' do
   visit '/posts'
   create_post
   find("img[src*='test.png']").click
   expect(page).to have_content 'My first post'
  #  expect(current_path).to eq "/posts/1"
  end

end
end
