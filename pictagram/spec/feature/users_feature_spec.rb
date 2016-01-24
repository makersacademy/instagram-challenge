require 'rails_helper'
require 'web_helper'
feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  context 'when user not signed in' do
    it 'should not allow a user to create a post' do
      visit('/')
      click_link 'Add a post'
      expect(current_path).to eq '/users/sign_in'
    end
  end

  context 'user' do
    it 'can only edit their own post' do
      visit('/')
      sign_up
      create_post
      click_link 'Sign out'
      sign_up2
      expect(page).not_to have_link 'Edit yummy!'
    end
  end

  it 'can only  delete their own comment' do
      visit('/')
      sign_up
      create_post
      click_link 'Comment yummy!'
      fill_in 'comment[comment]', with: "looks yum!"
      click_link 'Sign out'
      sign_up2
      expect(page).to_not have_content 'Edit Yummy'
    end
end
