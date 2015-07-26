require 'rails_helper'

feature "User" do
  context "not signed in and on the homepage" do
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

  context "signed in on the homepage" do

    let!(:user) { FactoryGirl.create(:user) }
    before { login_as(user, :scope => :user) }

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

  context 'profile pages' do

    let!(:user) { FactoryGirl.create(:user) }
    let!(:image){ FactoryGirl.create(:image, user_id: user.id) }
    before { login_as(user, :scope => :user) }

    scenario "shows user's images with it's info" do
      visit '/'
      click_link 'My Profile'
      expect(page).to have_content image.description
      expect(page).to have_selector 'img[src*="fatty.jpg"]'
      expect(page).to have_content image.likes
    end

    scenario "shows images comments" do
      image.comments.create_with_user({content: 'Adorable'}, user)
      visit '/'
      click_link 'My Profile'
      expect(page).to have_content 'Adorable'
    end

    scenario "can delete images" do
      visit '/'
      click_link 'My Profile'
      find("a:nth-of-type(6)").click
      expect(page).to have_content 'Image deleted successfully'
    end

    scenario "cannot delete images which they have not created" do
      another_user = FactoryGirl.create(:user)
      FactoryGirl.create(:image, user_id: another_user.id)
      visit "/users/#{another_user.id}"
      find("a:nth-of-type(6)").click
      expect(page).to have_content 'You are not the creator of this image'
    end

  end
end
