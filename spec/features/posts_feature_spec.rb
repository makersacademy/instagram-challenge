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

  context 'add post when signed in' do
    scenario 'directs user to log in if not logged in' do
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content('Log in')
    end

    scenario 'prompts user to fill out form and displays post name' do
      sign_up_user1
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content 'Add a New Post'
      fill_in 'Name', with: 'Istanbul'
      click_button 'Add post'
      expect(page).to have_content 'Istanbul'
      expect(current_path).to eq '/posts'
    end

  #    scenario 'successfully adds a new picture' do
  #      # sign_in
  #      visit '/posts'
  #      click_link "Add a post"
  #      expect(page).to have_content 'Add a New Post'
  #      fill_in "Name", with: "Istanbul"
  #      attach_file 'Image', 'spec/features/support/istanbul.jpg'
  #      click_button "Add post"
  #      expect(page).to have_selector("img[src*='istanbul.jpg']")
  #    end
  end

  def sign_up_user1
    visit('/users/sign_up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

end
