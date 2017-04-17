require 'rails_helper'

feature 'posts' do

  before do
    user = create :user
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'owen@gmail.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
  end

  context 'no posts have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'New Post'
    end
  end

  context 'creating posts'do
    scenario 'can create a post' do
      click_link 'New Post'
      attach_file('Image', "spec/files/images/kitten.png")
      fill_in 'Caption', with: 'cute kitty'
      click_button 'Create Post'
      expect(page).to have_content('cute kitty')
      expect(page).to have_css("img[src*='kitten.png']")
      expect(page).to have_content('Owen')
    end

    scenario 'displays user_name'do
      click_link 'New Post'
      attach_file('Image', "spec/files/images/kitten.png")
      fill_in 'Caption', with: 'cute kitty'
      click_button 'Create Post'
      expect(page).to have_content('Owen')
    end

    it 'needs an image to create a post' do
      click_link 'New Post'
      fill_in 'Caption', with: ""
      click_button 'Create Post'
      expect(page).to have_content("Your new post couldn't be created")
    end


  end

  context 'Reading posts' do
    scenario 'the index displays the posts' do
      post1 = create_post("Testing post 1")
      post2 = create_post("Testing post 2")
      expect(page).to have_content("Testing post 1")
      expect(page).to have_content("Testing post 2")
      expect(page).to have_css("img[src*='kitten']")
    end
    scenario 'Can click and view a single post' do
      post = create_post("Test caption")
      visit '/'
      find(".image").click
      expect(page).to have_content("Test caption")
    end
  end

  context 'Updating posts' do
    scenario 'Can edit a post' do
      post = create_post("post 1")
      click_link('Kitten')
      click_link 'Edit'
      fill_in 'Caption', with: "Wrong photo, with typos in caption!"
      click_button 'Update Post'
      expect(page).to have_content("Post updated")
      expect(page).to have_content("Wrong photo, with typos in caption!")
      expect(page).not_to have_content("post 1")
    end
    scenario 'a user cannot edit a post they did not create' do
      post = create_post("Test caption")
      click_link('Sign out')
      click_link('Sign up')
      fill_in('Email', with: 'test2@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      expect(page).not_to have_content('Edit')
    end
  end

  context 'Deleting posts' do
    scenario 'Can delete a single post' do
      post1 = create_post("This needs to be deleted")
      visit '/'
      click_link('Kitten')
      click_link 'Delete'
      expect(page).to have_content('Post deleted successfully')
      expect(page).to_not have_content('This needs to be deleted')
    end
  end

  def create_post(caption)
      click_link 'New Post'
      attach_file('Image', "spec/files/images/kitten.png")
      fill_in 'Caption', with: caption
      click_button 'Create Post'
  end
end
