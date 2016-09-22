require 'rails_helper'

feature 'posts' do
  before :each do
    visit '/'
  end
  scenario 'can create a new post' do
    sign_up("test@test.com")
    click_link 'New Post'
    attach_file('Image', "spec/files/images/zoe.jpg")
    fill_in 'Caption', with: 'Zoe #cooldog'
    click_button 'Create Post'
    expect(page).to have_content("#cooldog")
    expect(page).to have_css("img[src*='zoe.jpg']")
  end

  scenario 'throws error if image isn\'t attached' do
    sign_up("test@test.com")
    click_link 'New Post'
    fill_in 'Caption', with: 'Zoe'
    click_button 'Create Post'
    expect(page).to have_content"You must attach an image to a post"
  end
  context "view posts" do
    background do
      job_one = create(:post, caption: "Zoe is awesome")
      job_two = create(:post, caption: "Zoe is the best")
      visit '/'
    end
    scenario 'display multiple posts' do
      expect(page).to have_content("Zoe is awesome")
      expect(page).to have_content("Zoe is the best")
      expect(page).to have_css("img[src*='zoe.jpg']")
    end

    scenario 'view a single post' do
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      expect(current_path).to eq(post_path(1))
      expect(page).to have_content("Zoe is awesome")
    end
  end

  context 'edit post' do
    background do
      image = create(:post, caption: "Zoe is awesome")

      sign_up("test@test.com")
      find(:xpath, "//a[contains(@href,'posts/1')]").click
    end
    scenario 'user can edit post' do
      click_link "Edit Post"
      fill_in "Caption", with: "Zoe is the best"
      click_button "Update Post"
      expect(page).to have_content "Post successfully updated"
      expect(page).to have_content "Zoe is the best"
    end
  end

  context 'delete post' do
    scenario 'user can delete post' do
      image = create(:post, caption: "Zoe is awesome")

      sign_up("test@test.com")
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      click_link "Edit Post"
      click_link "Delete Post"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Successfully deleted")
      expect(page).not_to have_content("Zoe is awesome")
    end
  end

  def sign_up(email)
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: email
    fill_in 'Password', with: 'bananas'
    fill_in 'Password confirmation', with: 'bananas'
    click_button 'Sign up'
  end
end
