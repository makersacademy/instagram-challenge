require 'rails_helper'

feature 'comments' do

  context 'user is signed in' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      visit '/users/sign_in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    scenario 'there are no posts to comment on' do
      visit '/posts'
      expect(page).to have_content('No posts yet')
      expect(page).not_to have_content('Comment on this post')
    end

    scenario 'there is only a post by the current user' do
      visit '/posts'
      post = FactoryGirl.build(:post)
      post.user_id = @user.id
      post.save
      visit '/posts'
      expect(page).to have_content('Factory caption is here')
      expect(page).not_to have_content('Comment on this post')
    end


  end

  context 'there is a post by another user' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      visit '/users/sign_in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      user2 = FactoryGirl.create(:second_user)
      post = FactoryGirl.build(:post)
      post.user_id = user2.id
      post.save
      comment = FactoryGirl.build(:comment)
      comment.user_id = @user.id
      comment.post_id = post.id
      comment.save
    end

    scenario 'There is a comment on a post by the current user' do
      visit '/posts'
      expect(page).to have_content('This is a comment from the factory')
      expect(page).not_to have_content('Comment on this post')
    end

    scenario 'There is a post that current user could comment on' do
      click_link 'Sign out'
      user3 = FactoryGirl.create(:user_3)
      visit '/users/sign_in'
      fill_in 'Email', with: user3.email
      fill_in 'Password', with: user3.password
      click_button 'Log in'
      visit '/posts'
      expect(page).to have_content('Factory caption is here')
      expect(page).to have_content('This is a comment from the factory')
      expect(page).to have_content('Comment on this post')
    end


  end

end
