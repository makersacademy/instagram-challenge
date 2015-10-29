require 'rails_helper'

feature 'posts' do

  before(:each) do
    post = FactoryGirl.create(:post)
  end

  context "User logged in" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario 'posts can be created with image and caption' do
      visit '/posts'
      click_link 'New post'
      attach_file('Image', 'spec/features/test.jpg')
      fill_in('Caption', with:'This is the BBC')
      click_button 'Create Post'
      expect(page).to have_content('This is the BBC')
      expect(page).to have_css("img[src*='test.jpg']")
    end
  end

  context "User not logged in" do

    scenario 'anyone can view posts ' do
      visit '/'
      expect(page).to have_content('Factory caption is here')
      expect(page).to have_css("img[src*='test.jpg']")
    end

    scenario 'new post link should be hidden' do
      visit '/posts'
      expect(page).not_to have_content('New post')
    end

    scenario 'new post url should redirect to log in page' do
      visit '/posts/new'
      expect(page).to have_content('You need to
      sign in or sign up before continuing.')
    end
  end
end
