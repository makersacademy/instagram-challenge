require 'rails_helper'
require 'features/helpers/helpers'

RSpec.configure do |c|
  c.include Helpers
end


describe 'Posts' do

  context 'with no posts' do
    scenario 'will show an add image link' do
      sign_in_helper
      visit '/posts'
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

    scenario 'by a user will show the users name' do
      sign_in_helper
      visit '/posts'
      click_link "Add Image"
      fill_in "Name", with: "at the beach"
      click_button "Add Image"
      expect(page).to have_content 'test@test.com'
    end

  end

  context 'view a post.' do
    let!(:users_post) {Post.create(name: "at home")}

    scenario 'User can view a specific post' do
      sign_in_helper
      visit '/posts'
      click_link users_post.id
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

  context 'filtering user images.' do

    scenario 'With 2 users that do not follow each other cannot see the others image' do
      sign_in_helper
      add_image_helper("at the beach")
      click_link "Sign out"
      sign_in_helper('AnotherTester@test.com')
      expect(page).to have_content "at the beach"
    end

    scenario 'view all images form all users' do
      sign_in_helper
      add_image_helper
      click_link "Sign out"
      sign_in_helper('AnotherTester@test.com')
      add_image_helper('in the snow')
      click_button "All Posts"
      expect(page).to have_content 'in the snow'
      expect(page).to have_content 'at the beach'
    end

  end

  context 'follow posts' do
  end

end



