require 'rails_helper'

feature 'users' do
  feature 'a user can sign in and out' do
    context 'user not signed in and on the homepage' do
      it 'should see a sign in link and a sign up link' do
        visit '/'
        expect(page).to have_link('Sign in')
        expect(page).to have_link('Sign up')
      end

      it 'should not see sign out link' do
        visit '/'
        expect(page).not_to have_link('Sign out')
      end
    end
  end

  context "user signed in on the homepage" do
    before do
      user = create(:user)
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  feature 'user creating pictures' do
    context 'a user is logged in' do
      before do
        user = create(:user)
        visit '/'
        click_link 'Sign in'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end

      it 'allows a user to visit all pages' do
        visit new_picture_path
        expect(page.status_code).to be 200
        expect(page).not_to have_content 'You need to sign in or sign up before continuing.'
      end
    end

    context 'a user is not logged in' do
      before do
        @picture = create(:picture)
      end

      it 'does not allow a user add, comment on or delete a picture' do
        visit '/'
        expect(page).not_to have_link 'Add a picture'
        visit picture_path(@picture)
        expect(page).not_to have_link 'Delete this picture'
        expect(page).not_to have_link 'Comment on this picture'
      end
    end
  end
end
