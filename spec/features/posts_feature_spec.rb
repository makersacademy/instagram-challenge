require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      user = build(:user)
      visit '/posts'
      sign_up(user)
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'restaurants have been added' do

    scenario 'display posts' do
      user = build(:user)
      visit '/posts'
      sign_up(user)
      make_post 'hey'
      expect(page).to have_content('hey')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'user must be logged in to create a post' do
      visit '/posts'
      click_link 'Add a post'
      expect(page).not_to have_content 'Create Post'
      expect(current_path).to eq '/users/sign_in'
    end


  scenario 'prompts user to fill out a form, then displays the new post' do
    user = build(:user)
    visit '/posts'
    sign_up(user)
    make_post 'test'
    expect(page).to have_content 'test'
    expect(current_path).to eq '/posts'
  end
end

  context 'an invalid post' do
    it 'does not let you submit a blank post' do
      user = build(:user)
      sign_up(user)
      click_link 'Add a post'
      fill_in 'Content', with: ''
      click_button 'Create Post'
      expect(page).to have_content 'error'
    end
end

  context 'viewing posts' do

  scenario 'lets a user view a post' do
    user = build(:user)
    sign_up(user)
    make_post 'hi there'
    click_link 'hi there'
    expect(page).to have_content 'hi there'
  end

  context 'editing posts' do

  scenario 'let a user edit a post' do
   user = build(:user)
   sign_up(user)
   make_post 'hey'
   click_link 'Edit hey'
   fill_in 'Content', with: 'hello'
   click_button "Update Post"
   expect(page).to have_content 'hello'
   expect(current_path).to eq '/posts'
  end

  scenario 'user can only edit their own posts' do
    user = build(:user)
    user2 = build(:user, email: "different@gmail.com")
    sign_up(user)
    make_post 'not yours'
    click_link "Sign out"
    sign_up(user2)
    expect(page).to_not have_content "Edit not yours"
  end

end

  context 'deleting posts' do

    scenario 'removes a post when a user clicks a delete link' do
      user = build(:user)
      sign_up(user)
      make_post 'remove me'
      click_link 'Delete remove me'
      expect(page).not_to have_content 'remove me'
      expect(page).to have_content 'Post deleted successfully'
    end

    scenario "user cannot delete another user's posts" do
      user = build(:user)
      user2 = build(:user, email: "different@gmail.com")
      sign_up(user)
      make_post 'oops'
      click_link "Sign out"
      sign_up(user2)
      expect(page).not_to have_link 'Delete oops'
    end
  end

end

end
