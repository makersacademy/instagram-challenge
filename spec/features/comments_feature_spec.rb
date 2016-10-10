require 'rails_helper'

feature 'comments' do
  context 'comments can be left on posts' do
      let!(:cat){Post.create(image_file_name: 'cat.jpg', caption:'Awesome cat')}

    scenario 'adding a comment to a post' do
      visit '/'
      click_link 'Sign up'
      fill_in 'user[email]', with: "testing@test.com"
      fill_in 'user[password]', with: "testing"
      fill_in 'user[password_confirmation]', with: "testing"
      click_link 'Comment'
      expect(current_path).to eq "/posts/#{cat.id}/comments/new"
    end
    scenario 'showing comment on index page' do
      visit '/'
      click_link 'Sign up'
      fill_in 'user[email]', with: "testing@test.com"
      fill_in 'user[password]', with: "testing"
      fill_in 'user[password_confirmation]', with: "testing"
      click_link 'Comment'
      fill_in 'comment[comments]', with: "that cat is fugly"
      click_button 'Leave comment'
      expect(page).to have_content 'that cat is fugly'
    end
  end
end
