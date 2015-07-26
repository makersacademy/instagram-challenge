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

  end
end
