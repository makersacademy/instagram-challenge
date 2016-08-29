require 'rails_helper'

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
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
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


  it "should not be able to delete the post other his/hers" do
    click_link "New Post"
    fill_in "Caption", with: "My new post"
    page.attach_file("post_image", Rails.root + 'app/assets/images/imagename.jpg')
    click_button "Create Post"
    click_link "Sign out"
    click_link('Sign up')
    fill_in('Email', with: 'test2@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    click_link('Delete')
    expect(page).to have_content('You shall not pass')
  end
    it "should not be able to edit the post other than his/hers" do
      click_link "New Post"
      fill_in "Caption", with: "My new post"
      page.attach_file("post_image", Rails.root + 'app/assets/images/imagename.jpg')
      click_button "Create Post"
      click_link "Sign out"
      click_link('Sign up')
      fill_in('Email', with: 'test2@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      click_link('Edit')
      click_button ('Update Post')
      expect(page).to have_content('You shall not pass')
  end

  it "should see the user's email" do
    click_link "New Post"
    fill_in "Caption", with: "My new post"
    page.attach_file("post_image", Rails.root + 'app/assets/images/imagename.jpg')
    click_button "Create Post"
    expect(page).to have_content('test@example.com')
  end 
end
end
