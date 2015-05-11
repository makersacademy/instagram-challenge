require 'rails_helper'

feature 'picture' do 

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign Up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end
  end


  context 'deleting a post' do
    scenario 'only a user who made it' do
      visit '/pictures'
      click_link "destroy"
      click_link "Ok"
      expect(page).to have_content('Post deleted successfully')
    end
  end

  context 'uploading an image' do
    scenario 'can upload an image' do
      visit '/'
      click_link 'Add a New Picture'
      attach_file('post_image', 'spec/Motley.png')
      fill_in :Description, with: 'Hello!'
      click_button 'Create Picture'
      expect(page).to have_content("Hello!")
    end
  end
end