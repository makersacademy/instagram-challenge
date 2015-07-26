require 'rails_helper'

feature 'Posts' do
  context 'no posts added yet' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'a post added' do
     before {Post.create name: 'Istanbul'}
     scenario 'displays post on main page' do
       visit '/posts'
       expect(page).to have_content 'Istanbul'
       expect(page).not_to have_content 'No posts yet'
     end
   end

  context 'when not logged in' do
    scenario 'directs user back to log in' do
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content('Log in')
    end
  end

  context 'Adding posts once signed up/logged in' do
    scenario 'successfully adds a new post' do
      signup_login_user1
      visit '/posts'
      add_post
      expect(page).to have_css("img[src*='istanbul.jpg']")
      expect(page).to have_content("Istanbul")
    end

    scenario 'does not add post without a name/credit' do
      signup_login_user1
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content 'Add a new post'
      click_button 'Add'
      expect(page).to have_content 'Please correct the following errors to save this post:'
    end

  end

  context 'Viewing posts' do

    let!(:post) { Post.create(image: File.open("#{Rails.root}/spec/features/istanbul.jpg"), name: "Istanbul at sunset") }

    scenario 'user can view individual posts' do
      signup_login_user1
      add_post
      visit '/posts'
      click_link "#{post.name}"
      expect(current_path).to eq "/posts/#{post.id}"
      expect(page).to have_content 'Istanbul at sunset'
    end
  end


  context 'Deleting posts' do

     scenario 'post is removed if user is logged in' do
       signup_login_user1
       add_post
       click_link 'Delete'
       expect(page).to have_content 'Post deleted'
     end

     scenario 'post cannot be deleted by a different user' do
       signup_login_user1
       add_post
       click_link('Sign out')
       signup_login_user2
       click_link 'Delete'
       expect(page).not_to have_content 'Post deleted'
       expect(page).to have_content 'You are not permitted to remove this post'
     end

  end



  def signup_login_user1
    visit('/users/sign_up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def signup_login_user2
    visit('/users/sign_up')
    fill_in('Email', with: 'test2@example.com')
    fill_in('Password', with: '12345678')
    fill_in('Password confirmation', with: '12345678')
    click_button('Sign up')
  end

  # ASK THE DIFFERENCE BETWEEN THESE 2 WAYS - ARE BOTH STUBBING - IS ONE PREFERABLE TO THE OTHER?
  
  def add_post
    visit('/')
    click_link "Add a post"
    expect(page).to have_content 'Add a new post'
    attach_file 'post_image', 'spec/features/istanbul.jpg'
    fill_in 'post_name', with: 'Istanbul'
    click_button "Add"
  end

  # def add_post_alt
  #   visit('/')
  #   click_link "Add a post"
  #   expect(page).to have_content 'Add a new post'
  #   Post.create(image: File.open("#{Rails.root}/spec/features/istanbul.jpg"))
  #   click_button "Add"
  # end

end
