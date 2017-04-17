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

  context "User can sign up" do
    before do
      visit('/')
      click_link 'Sign up'
    end
    it 'requires a user name to successfully create an account' do
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest', match: :first
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
      expect(page).to have_content("can't be blank")
    end

    it 'requires a user name to be more than 4 characters' do
      fill_in 'User name', with: 'oj'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest', match: :first
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
      expect(page).to have_content('minimum is 4 characters')
    end
  end

  context "User can sign in" do
    it "can sign in if user already signed up" do
      user = create :user
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: 'owen@gmail.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
      expect(page).to_not have_content('Sign up')
      expect(page).to have_content('Sign out')
    end
  end

  context "User is signed in" do
    it 'can sign out once signed in' do
      sign_up
      click_link 'Sign out'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end
  end

  def sign_up
    visit '/'
    click_link 'Sign up'
    fill_in 'User name', with: 'owen_lamb'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testtest', match: :first
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
  end

end
