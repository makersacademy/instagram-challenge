require 'rails_helper'

feature 'Posts' do 
  
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  context 'no posts have been added' do 
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts added yet')
      expect(page).to have_link('Add a post')
    end
  end 

  context 'posts have been added' do 
    before do 
      Post.create(title: "Me with my dog")
    end  

    scenario 'display posts' do 
      visit '/posts'
      expect(page).to have_content('Me with my dog')
      expect(page).not_to have_content('No posts added yet')
    end   

  end 

  context 'prompts user to fill out a form then displays new post' do 
    scenario 'display posts' do 
      visit '/posts'
      click_link('Add a post')
      fill_in 'Title', with: 'Me with my dog'
      fill_in 'Description', with: 'My best friend'
      click_button 'Create Post'
      expect(page).to have_content('Me with my dog')
      expect(current_path).to eq '/posts'
    end  
  end  

  context 'viewing post page' do 
    
    let!(:post){Post.create(title:'Me with my dog')}

    scenario 'lets a user view a post page' do 
      visit '/posts'
      click_link('Me with my dog')
      expect(current_path).to eq("/posts/#{post.id}")
    end  
  end  

  context 'editing posts' do 

    before {Post.create title: 'Me with my dog'}

    scenario 'let a user edit a post' do 
      visit '/posts'
      click_link 'Edit post'
      fill_in 'Title', with: 'My dog'
      click_button 'Update Post'
      expect(page).to have_content 'My dog'
      expect(current_path).to eq '/posts'
    end  

  end  

  context 'deleting posts' do 

    before {Post.create title: 'Me and my dog'}

    scenario 'let a user delete a post' do 
      visit '/posts'
      click_link 'Delete post'
      expect(page).not_to have_content 'Me and my dog'
      expect(page).to have_content('Post deleted successfully')
    end
  end 

end  