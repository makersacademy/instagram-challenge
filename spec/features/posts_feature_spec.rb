require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      one_post = create(:post, caption: "first post!")
      other_post = create(:post, caption: "second post")
    end

    scenario 'display posts' do
     visit '/posts'
     expect(page).to have_content 'first post!'
     expect(page).to have_content 'second post'
     expect(page).to have_css("img[src*='googlelogo.png']")
   end
 end


  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      create_post
      expect(page).to have_content 'google'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do
    scenario 'lets a user view a post' do
     post = create(:post, caption: "google logo")
     visit '/'
     link = page.first(:xpath, '//a')
     link.click
     expect(page).to have_content 'google logo'
     expect(page.current_path).to eq(post_path(post))
     expect(page).to have_css("img[src*='googlelogo.png']")
   end
 end

  context 'editing posts' do
    scenario 'a user can edit a post' do
      pending
      post = create(:post, caption: "google logo")
      visit '/'
      mylink = page.first(:xpath, "//a[contains(@href,'posts/1')]")
      # p mylink
      mylink.click
      click_link('Edit Post')
      fill_in 'Caption', with: "updated caption"
      expect(page).to have_content 'updated caption'
      expect(page).not_to have_content 'google logo'
      expect(page).to have_css("img[src*='googlelogo.png']")
   end
  end
end