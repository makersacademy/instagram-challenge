require 'rails_helper'

feature 'Commenting on posts' do

  # let!(:post) { Post.create(image: File.open("#{Rails.root}/spec/features/istanbul.jpg"), name: "Istanbul at sunset") }

  # before do
  #   visit('/users/sign_up')
  #   fill_in('Email', with: 'test@example.com')
  #   fill_in('Password', with: 'testtest')
  #   fill_in('Password confirmation', with: 'testtest')
  #   click_button('Sign up')
  #   click_link 'Add a post'
  #   expect(page).to have_content 'Add a new post'
  #   attach_file 'post_image', 'spec/features/istanbul.jpg'
  #   fill_in 'post_name', with: 'Istanbul'
  #   click_button 'Add'
  # end

  let!(:post) { Post.create(image: File.open("#{Rails.root}/spec/features/istanbul.jpg"), name: "Istanbul at sunset") }

  scenario 'allows users to leave comments' do
    sign_up_user1
    visit '/posts'
    click_link 'Comment'
    expect(current_path).to eq "/posts/#{post.id}/comments/new"
    fill_in 'comment_comments', with: 'wow'
    click_button 'Add comment'
    expect(page).to have_content 'wow'
  end

  scenario 'cannot leave a blank comment' do
    sign_up_user1
    visit '/posts'
    click_link 'Comment'
    expect(current_path).to eq "/posts/#{post.id}/comments/new"
    click_button 'Add comment'
    expect(page).to have_content "Comments can't be blank"
  end


  def sign_up_user1
    visit('/users/sign_up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end


end
