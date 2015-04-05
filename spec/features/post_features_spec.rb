require 'rails_helper'

describe 'Posts' do

  context 'with no posts' do
    scenario 'an add add image link will show' do
      visit '/posts'
      expect(page).to have_link "Add Image"
    end
  end

  context 'add a new post' do
    scenario 'with a title then displays the post' do
      visit '/posts'
      click_link "Add Image"
      fill_in "Name", with: "at the beach"
      click_button "Add Image"
      expect(page).to have_content "at the beach"
    end
  end

  context 'view a post.' do
    let!(:users_post) {Post.create(name: "at home")}

    scenario 'User can view a specific post' do
      visit '/posts'
      click_link "at home"
      expect(current_path).to eq "/posts/#{users_post.id}"
      expect(page).to have_content "at home"
    end
  end

  context 'delete a post.' do
    let!(:users_post) {Post.create(name: "at home")}

    scenario 'User can delete a post' do
      visit '/posts'
      click_link "at home"
      click_link "Delete at home"
      expect(page).not_to have_content "at home"
      expect(page).to have_content 'Post deleted successfully'
    end
  end

end

