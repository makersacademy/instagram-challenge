# require 'rails_helper'

# feature 'posts' do

 #  context 'posts have been added' do
 #    before do
 #      user = create :user
 #      one_post = create(:post, caption: "first post!")
 #      other_post = create(:post, caption: "second post")
 #    end

 #    scenario 'display posts' do
 #     visit '/posts'
 #     expect(page).to have_content 'first post!'
 #     expect(page).to have_content 'second post'
 #     expect(page).to have_css("img[src*='googlelogo.png']")
 #   end
 # end


  # context 'creating posts' do
  #   scenario 'prompts user to fill out a form, then displays the new post' do
  #     create_post
  #     expect(page).to have_content 'google'
  #     expect(current_path).to eq '/posts'
  #   end
  # end

 #  context 'viewing posts' do
 #    scenario 'lets a user view a post' do
 #     post = create(:post, caption: "google logo")
 #     visit '/posts'
 #     find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
 #     expect(page).to have_content 'google logo'
 #     expect(page.current_path).to eq(post_path(post))
 #     expect(page).to have_css("img[src*='googlelogo.png']")
 #   end
 # end

 #  context 'editing posts' do
 #    scenario 'a user can edit a post' do
 #      post = create(:post, caption: "google logo")
 #      visit '/'
 #      find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
 #      click_link('Edit Post')
 #      fill_in 'Caption', with: "updated caption"
 #      attach_file('Image',"spec/files/images/tomate.jpg")
 #      click_button('Update Post')

 #      expect(page).to have_content 'updated caption'
 #      expect(page).not_to have_content 'google logo'
 #      expect(page).to have_css("img[src*='tomate.jpg']")
 #      expect(page).not_to have_css("img[src*='googlelogo.png']")
 #   end
 #  end

 #  context 'deleting posts' do
 #    scenario 'lets a user delete a post' do
 #      post = create(:post, caption: "google logo")
 #      visit '/'
 #      find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
 #      click_link('Delete')
 #      expect(page.current_path).to eq('/posts')
 #      expect(page).to have_content("Post deleted")
 #      expect(page).not_to have_content 'google logo'
 #   end
 # end

 # context 'no picha, no post' do
 #   scenario 'without uploading a pic no post can be created' do
 #    pending
 #     visit '/'
 #     click_link('New Post')
 #     fill_in 'Caption', with: 'google'
 #     click_link('Create Post')
 #     expect(page.current_path).to eq('/posts/new')
 #     expect(page).to have_content("Oh no! Problem creating post, check the form")
 #    end
 # end

# end