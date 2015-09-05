require 'rails_helper'

feature "User Features" do
  context 'when not signed in' do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit ('/')
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it "should not see a sign out link on the home page before signing-in" do
      visit ('/')
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'when signed in' do
    before :all do
      sign_up_user

    end

    context 'and on the homepage' do
      before :each do
        visit '/'
      end

      it "should not see a 'sign in' link or a 'sign up' link" do
        expect(page).not_to have_link 'Sign in'
        expect(page).not_to have_link 'Sign up'
      end

      it "should see a 'sign out' link" do
        expect(page).to have_link 'Sign out'
      end
    end
  end

  private

  def sign_up_user
    visit '/'
    click_link 'Sign up'
    fill_in 'email', with: "user@email.com"
    fill_in 'password', with: "passwordpassword"
    fill_in 'password_confirmation', with: "passwordpassword"
    click_button 'Sign up'
  end
end