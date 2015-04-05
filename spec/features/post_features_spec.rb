require 'rails_helper'

describe 'Posts' do

  context 'with no posts' do
    scenario 'an add add image link will show' do
      sign_in_helper
      visit '/posts'
      sign_in_helper
      expect(page).to have_link "Add Image"
    end
  end

  context 'add a new post' do
    scenario 'with a name then displays the post' do
      sign_in_helper
      visit '/posts'
      click_link "Add Image"
      fill_in "Name", with: "at the beach"
      click_button "Add Image"
      expect(page).to have_css("img[alt = 'at the beach']")
    end
  end

  context 'view a post.' do
    let!(:users_post) {Post.create(name: "at home")}

    scenario 'User can view a specific post' do
      sign_in_helper
      visit '/posts'
      puts users_post.id
      click_link "/posts/#{users_post.id}"
      expect(current_path).to eq "/posts/#{users_post.id}"
      expect(page).to have_content "at home"
    end
  end

  context 'delete a post.' do
    let!(:users_post) {Post.create(name: "at home")}

    scenario 'User can delete a post' do
      sign_in_helper
      visit '/posts'
      click_link "at home"
      click_link "Delete at home"
      expect(page).not_to have_content "at home"
      expect(page).to have_content 'Post deleted successfully'
    end
  end

end

def sign_in_helper
  visit '/'
  click_link 'Sign up'
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

