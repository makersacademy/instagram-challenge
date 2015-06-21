require 'rails_helper'

feature 'User' do
  context 'User signs in and out' do
    it "should see a sign in and sign up link" do
      visit ('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not be able to see sign-out link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "User is not signed in and on homepage" do
    before do
      @user = User.create(email: 'test@test.com', password: '123456789')
      @picture = @user.pictures.create(caption: 'Photo 1')
      @picture.comments.create(comment: 'Hey there')
    end

    it "should not be able to add a picture" do
      visit('/')
      click_link('Add Picture')
      expect(current_path).to eq ('/users/sign_in')
    end

    it "should not be able to leave a comment" do
      visit('/')
      find('.comment').click
      click_link('Add Comment')
      expect(current_path).to eq ('/users/sign_in')
    end

    it "but should be able to see comments" do
      visit('/')
      find('.comment').click
      expect(page).to have_content('Hey there')
    end
  end

end