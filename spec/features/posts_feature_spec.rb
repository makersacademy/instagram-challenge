require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'post has been added successfully' do
     before {Post.create name: 'Istanbul'}
     scenario 'Display photos' do
       visit '/posts'
       expect(page).to have_content 'Istanbul'
       expect(page).not_to have_content 'No posts yet'
     end
   end

  #  context 'add post' do
  #    scenario 'successfully adds a new picture' do
  #      # sign_in
  #      visit '/posts'
  #      click_link "Add a post"
  #      expect(page).to have_content 'Add post'
  #      fill_in "Name", with: "Istanbul"
  #      attach_file 'Image', 'spec/features/support/istanbul.jpg'
  #      click_button "Add post"
  #      expect(page).to have_selector("img[src*='istanbul.jpg']")
  #    end
  #  end


end
