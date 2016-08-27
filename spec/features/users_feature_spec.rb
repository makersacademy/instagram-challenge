require 'rails_helper'

feature "User can sign in and out" do

  let(:post) { build(:post) }
  let(:user) { build(:user) }
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  context "user not signed in and on the homepage", type: :user do
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

  context "user signed in on the homepage", type: :user  do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      fill_in('Password confirmation', with: user.password_confirmation)
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
  end

  context 'restrictions', type: :user do
    it 'cannot post images when not logged in' do
      visit('/')
      click_link 'Post an image'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
    context 'creator of post not signed in' do

      before {user_sign_in(user2)}

      scenario 'User can only edit caption of post they have created' do
        visit '/'
        click_link "post#{post.id}"
        expect(page).not_to have_link 'Edit caption'
      end

      # scenario 'User can only delete post they have created' do
      #   click_link "Delete #{restaurant.name}"
      #   expect(page).to have_content restaurant.name
      #   expect(page).to have_content 'Cannot delete restaurant'
      # end
    end
  end
end
