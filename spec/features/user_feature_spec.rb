require 'rails_helper'

feature "User Features" do
  context 'when not signed in' do
    before { visit root_path }
    
    it "should see a 'sign in' link and a 'sign up' link" do
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it "should not see a sign out link on the home page before signing-in" do
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'after signing up' do
    before { sign_up_user }

    context 'and on the homepage' do
      it "should not see a 'sign in' link or a 'sign up' link" do
        expect(page).not_to have_link 'Sign in'
        expect(page).not_to have_link 'Sign up'
      end

      it "should see a 'sign out' link" do
        expect(page).to have_link 'Sign out'
      end
    end

    context 'after signing out' do
      before { sign_out }

      it 'should be on the homepage' do
        expect(current_path).to eq root_path
      end

      it 'should not see a sign-out link' do
        expect(page).not_to have_link 'Sign out'
      end

      it 'should see a sign-in link and a sign-up link' do
        expect(page).to have_link 'Sign in'
        expect(page).to have_link 'Sign up'
      end
    end
  end

  private

  def sign_up_user
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: "user@email.com"
    fill_in 'Password', with: "passwordpassword"
    fill_in 'Password confirmation', with: "passwordpassword"
    click_button 'Sign up'
  end

  def sign_out
    visit root_path
    click_link 'Sign out'
  end
end