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

  context 'when not signed in' do
    scenario 'directs user back to log in' do
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content('Log in')
    end
  end

  context 'when signed in' do
    # before do
    #   Post.create(name: 'Istanbul')
    # end

    scenario 'prompts user to fill out form and displays post name' do
      sign_up_user1
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content 'Add a new post'
      fill_in 'post_name', with: 'Istanbul'
      click_button 'Add'
      expect(page).to have_content 'Istanbul'
      expect(current_path).to eq '/posts'
    end

    scenario 'does not let you upload photo without a name/credit' do
      sign_up_user1
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content 'Add a new post'
      click_button 'Add'
      expect(page).to have_content 'Please correct the following errors to save this post:'
    end

     scenario 'successfully adds a new picture' do
       pending
       sign_up_user1
       visit '/posts'
       click_link "Add a post"
       expect(page).to have_content 'Add a new post'
       attach_file 'post_image', 'spec/features/istanbul.jpg'
       fill_in 'post_name', with: 'Istanbul'
       click_button "Add"
       expect(page).to have_content 'Istanbul'
       expect(page).to have_selector("img[src*='istanbul.jpg']")
     end
  end

  def sign_up_user1
    visit('/users/sign_up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

end
